import 'dart:convert';

import 'package:antlr4/antlr4.dart';
import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidLexer.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:candid_dart/internals/extension.dart';
import 'package:candid_dart/templates.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';

class TypeDefListener extends CandidBaseListener {
  final Set<String> typeDefs = {};
  final Map<String, String> primIdlMap = {};
  final Set<String> _prims = {};
  final Map<String, List<String>> _mapTypes = {};

  @override
  void enterDef(DefContext ctx) {
    var type = ctx.idType()!.text;
    typeDefs.add(type);
    var node = TypeNode(ctx.dataType()!);
    var first = node.children.first;
    if (first.ctx is IdTypeContext) {
      _mapTypes.putIfAbsent(first.ctx.text, () => []).add(type);
      var idTypeNode = first.children.first;
      if (idTypeNode.ctx is PrimTypeContext) {
        var id = idTypeNode.ctx.text;
        _prims.add(id);
        primIdlMap[type] = kPrimitiveTypeIDLMap[id]!;
      }
      return;
    }
    _eachNode(node, type, typeDefs);
  }

  @override
  void exitDid(DidContext ctx) {
    for (var prim in _prims) {
      var idl = kPrimitiveTypeIDLMap[prim]!;
      _ifContainsKey(prim, idl);
    }
  }

  void _ifContainsKey(String key, String idl) {
    if (_mapTypes.containsKey(key)) {
      var types = _mapTypes[key]!;
      primIdlMap.addEntries(types.map((e) => MapEntry(e, idl)));
      for (var t in types) {
        _ifContainsKey(t, idl);
      }
    }
  }

  void _eachNode(TypeNode node, String type, Set<String> defs) {
    var children = node.children;
    var ctx = node.ctx;
    if (ctx is PairTypeContext) {
      _check(type, defs, ctx);
      type = type + ctx.idType()!.text.pascalCase;
    }
    for (var child in children) {
      _eachNode(child, type, defs);
    }
  }

  void _check(String parent, Set<String> defs, PairTypeContext ctx) {
    var dataType = ctx.dataType()!;
    var idType = ctx.idType()!;
    var type = parent + idType.text.pascalCase;
    _addDef(type, defs, dataType);
    _checkVecType(type, defs, dataType);
    _checkOptType(type, defs, dataType);
  }

  void _checkOptType(
    String name,
    Set<String> defs,
    DataTypeContext dataType,
  ) {
    var optType = dataType.optType();
    if (optType != null) {
      var dataType = optType.dataType()!;
      _addDef(name, defs, dataType);
      _checkVecType(name, defs, dataType);
    }
  }

  void _checkVecType(String name, Set<String> defs, DataTypeContext dataType) {
    if (dataType.vecType() != null) {
      _addDef(name, defs, dataType.vecType()!.dataType()!);
    }
  }

  void _addDef(String name, Set<String> defs, DataTypeContext dataType) {
    if (dataType.recordType() != null || dataType.variantType() != null) {
      defs.add(name);
    }
  }
}

class ClassDefListener extends CandidBaseListener {
  ClassDefListener(this.defTypes, this.primIdlMap);

  final Set<String> defTypes;
  final Map<String, String> primIdlMap;
  final StringBuffer _sb = StringBuffer();
  final Map<String, List<ClassField>> classFields = {};

  String get classCodes => _sb.toString();

  @override
  void enterDef(DefContext ctx) {
    var type = ctx.idType()!.text;
    var node = TypeNode(ctx.dataType()!);
    var first = node.children.first;
    if (first.ctx is IdTypeContext) {
      var id = first.ctx.text;
      _sb.writeln("typedef $type = ${kPrimitiveTypeDartMap[id] ?? id};");
      return;
    }
    _eachNode(node, type);
  }

  void _eachNode(TypeNode node, String type) {
    var children = node.children;
    var ctx = node.ctx;
    if (ctx is RecordTypeContext || ctx is VariantTypeContext) {
      _resolveClassType(node, type);
    } else if (ctx is PairTypeContext) {
      type = type + ctx.idType()!.text.pascalCase;
    }
    for (var child in children) {
      _eachNode(child, type);
    }
  }

  void _resolveClassType(TypeNode node, String type) {
    var fields = node.children.map<ClassField>((e) {
      var child = e.children.first;
      var ctx = child.ctx;
      if (ctx is IdTypeContext) {
        var id = ctx.text;
        return ClassField(
          id: id,
          did: id,
          type: 'bool',
          idl: 'IDL.Null',
          obj: false,
          opt: true,
        );
      } else if (ctx is PairTypeContext) {
        var id = ctx.idType()!.text;
        // [idType,dataType] []
        var dataTypeChildNode = child.children.last.children.first;
        return _resolveTypeNode(dataTypeChildNode, id, type);
      }
      throw UnsupportedTypeContextException(ctx);
    }).toList(growable: false);
    var isVariant = node.ctx is VariantTypeContext;
    var clazz = Template(clazzTpl).renderString({
      'origin': node.ctx.text,
      'clazz': type,
      'variant': isVariant,
      'renderFields': ClassRender.renderFields(fields),
      'renderConstructorFields': ClassRender.renderConstructorFields(fields),
      'renderFromMapFields': ClassRender.renderFromMapFields(isVariant, fields),
      'renderIDL': isVariant
          ? ClassRender.renderVariantIDL(type, fields)
          : ClassRender.renderRecordIDL(fields),
      'renderToJsonFields': ClassRender.renderToJsonFields(fields),
    });
    classFields[type] = fields;
    _sb.writeln(clazz);
  }

  ClassField _resolveTypeNode(
    TypeNode node,
    String id,
    String type,
  ) {
    var ctx = node.ctx;
    if (ctx is IdTypeContext) {
      var text = ctx.text;
      var dartType = kPrimitiveTypeDartMap[text];
      var idlType = kPrimitiveTypeIDLMap[text];
      if (dartType != null && idlType != null) {
        String? deser;
        if (idlType == 'IDL.Principal') {
          deser = node.optional
              ? "{{val}}==null?null:$dartType.from({{val}})"
              : "$dartType.from({{val}})";
        }
        return ClassField(
          id: id,
          did: text,
          type: dartType,
          idl: idlType,
          obj: false,
          opt: node.optional,
          deser: deser,
        );
      }
      if (defTypes.contains(text)) {
        var isPrimType = primIdlMap.containsKey(text);
        return ClassField(
          id: id,
          did: text,
          type: text,
          idl: isPrimType ? primIdlMap[text]! : '$text.idl',
          obj: false,
          opt: true,
          // ser: ["{{val}}.toJson()", "{{val}}?.toJson()"],
          deser: isPrimType
              ? null
              : node.optional
                  ? "{{val}}==null?null:$text.fromMap({{val}})"
                  : "$text.fromMap({{val}})",
        );
      }
      return ClassField(
        id: id,
        did: text,
        type: 'bool',
        idl: 'IDL.Null',
        obj: false,
        opt: true,
      );
    } else if (ctx is VecTypeContext || ctx is OptTypeContext) {
      var child = node.children.first.children.first;
      var field = _resolveTypeNode(child, id, type);
      if (ctx is VecTypeContext) {
        var idlType = "IDL.Vec(${field.idl})";
        if (field.did == 'nat8' || field.did == 'int8') {
          var dartType = 'Uint8List';
          return ClassField(
            id: field.id,
            did: ctx.text,
            type: dartType,
            idl: idlType,
            obj: false,
            opt: node.optional,
            ser: node.optional
                ? "{{val}}?.toList(growable: false)"
                : "{{val}}.toList(growable: false)",
            deser: node.optional
                ? "{{val}}==null?null:$dartType.fromList({{val}})"
                : "$dartType.fromList({{val}})",
          );
        }
        var dartType = 'List<${field.type.opt(field.opt)}>';
        var ser = field.ser;
        if (ser != null) {
          ser =
              "{{val}}${node.optional ? '?' : ''}.map((dynamic e) => ${ser.replaceAll("{{val}}", "e")})";
        }
        var deser = field.deser;
        if (deser != null) {
          deser =
              "{{val}}${node.optional ? '?' : ''}.map((dynamic e) => ${deser.replaceAll("{{val}}", "e")}).toList(growable: false)";
        }
        return ClassField(
          id: field.id,
          did: ctx.text,
          type: dartType,
          idl: idlType,
          obj: false,
          opt: node.optional,
          ser: ser,
          deser: deser,
        );
      } else {
        return ClassField(
          id: field.id,
          did: ctx.text,
          type: field.type,
          idl: "IDL.Opt(${field.idl})",
          obj: field.obj,
          opt: true,
          ser: field.ser,
          deser: field.deser,
        );
      }
    } else if (ctx is VariantTypeContext || ctx is RecordTypeContext) {
      var newType = type + id.pascalCase;
      return ClassField(
        id: id,
        did: ctx.text,
        type: newType,
        idl: "$newType.idl",
        obj: true,
        opt: node.optional,
        // ser: ["{{val}}.toJson()", "{{val}}?.toJson()"],
        deser: node.optional
            ? "{{val}}==null?null:$newType.fromMap({{val}})"
            : "$newType.fromMap({{val}})",
      );
    } else if (ctx is RefTypeContext) {}

    throw UnsupportedTypeContextException(ctx);
  }
}

class IDLListener extends CandidBaseListener {
  final String clazz;
  final Set<String> defTypes;
  final Map<String, String> primIdlMap;
  String _idlCodes = "";

  String get idlCodes => _idlCodes;

  IDLListener(
    this.clazz,
    this.defTypes,
    this.primIdlMap,
  );

  @override
  void enterActor(ActorContext ctx) {
    var methTypes = ctx.actorType()?.methTypes() ?? [];
    var keys = StringBuffer();
    var idlMethods = StringBuffer();
    var reqMethods = StringBuffer();
    for (var md in methTypes) {
      var key = md.idType(0)!.text;
      var pcKey = key.pascalCase;
      keys.writeln("/// ${md.text}");
      keys.writeln("static const String $pcKey = '${md.getChild(0)?.text}';");
      var body = md.funcType();
      if (body != null) {
        var ann = body.funcAnn(0)?.text;
        var args = body.tupleType(0)!;
        var returns = body.tupleType(1)!;
        var argsNode = TypeNode(args);
        var returnsNode = TypeNode(returns);
        var argsField = _resolveTupleNode(argsNode);
        var returnsField = _resolveTupleNode(returnsNode);
        var idlValue = {
          'idlName': pcKey,
          'idlReq': argsField.map((e) => e.idl).join(","),
          'idlRep': returnsField.map((e) => e.idl).join(","),
          'funcAnno': ann.isNotBlank ? "'$ann'" : '',
        };
        String params;
        String idlParams;
        if (argsField.isEmpty) {
          params = '';
          idlParams = '<dynamic>[]';
        } else if (argsField.length == 1) {
          var first = argsField.first;
          params = '${first.type.opt(first.opt)} arg,';
          if (first.ser != null) {
            idlParams = "<dynamic>[${first.ser!.replaceAll("{{val}}", "arg")}]";
          } else {
            idlParams = "<dynamic>[arg]";
          }
        } else {
          params =
              'Tuple${argsField.length}<${argsField.map((e) => e.type.opt(e.opt)).join(",")}> args,';
          if (argsField.any((e) => e.ser != null)) {
            var ser = StringBuffer();
            for (var i = 0; i < argsField.length; ++i) {
              var f = argsField.elementAt(i);
              var ind = i + 1;
              if (f.ser != null) {
                ser.write(f.deser!.replaceAll("{{val}}", "args.item$ind"));
              } else {
                ser.write("args.item$ind");
              }
              ser.write(",");
            }
            idlParams = "<dynamic>[$ser]";
          } else {
            idlParams = "args.toList(growable: false)";
          }
        }
        idlMethods.writeln(Template(
          idlMethod,
          htmlEscapeValues: false,
        ).renderString(idlValue));
        var noReturn = returnsField.isEmpty;
        reqMethods.writeln(Template(
          idlReqMethod,
          htmlEscapeValues: false,
        ).renderString({
          ...idlValue,
          "methodName": key.camelCase,
          "renderParams": (_) => params,
          "renderParamsName": (_) => idlParams,
          "hasReturn": !noReturn,
          "returnType": noReturn
              ? 'void'
              : returnsField.length == 1
                  ? returnsField.first.type.opt(returnsField.first.opt)
                  : throw 'Return has more than one type.',
          "renderReturn": (_) {
            if (noReturn) {
              return '';
            }
            var deser = returnsField.first.deser;
            if (deser != null) {
              return "return ${deser.replaceAll("{{val}}", "resp")};";
            }
            return "return resp;";
          },
        }));
      }
    }
    _idlCodes = Template(
      idlTpl,
      htmlEscapeValues: false,
    ).renderString({
      "clazz": clazz,
      "fields": keys.toString(),
      "pairs": idlMethods.toString(),
      "methods": reqMethods.toString(),
    });
  }

  List<IDLField> _resolveTupleNode(TypeNode node) {
    return node.children
        .map((e) => _resolveTypeNode(e))
        .toList(growable: false);
  }

  IDLField _resolveTypeNode(TypeNode node) {
    var ctx = node.ctx;
    if (ctx is DataTypeContext) {
      return _resolveTypeNode(node.children.first);
    } else if (ctx is OptTypeContext) {
      var field = _resolveTypeNode(node.children.first);
      return IDLField(
        did: ctx.text,
        idl: "IDL.Opt(${field.idl})",
        type: field.type,
        opt: true,
      );
    } else if (ctx is IdTypeContext) {
      var text = ctx.text;
      var dartType = kPrimitiveTypeDartMap[text];
      var idlType = kPrimitiveTypeIDLMap[text];
      if (dartType != null && idlType != null) {
        String? deser;
        if (idlType == 'IDL.Principal') {
          deser = node.optional
              ? "{{val}}==null?null:$dartType.from({{val}})"
              : "$dartType.from({{val}})";
        }
        return IDLField(
          did: text,
          idl: idlType,
          type: dartType,
          opt: node.optional,
          deser: deser,
        );
      }
      if (defTypes.contains(text)) {
        var isPrimType = primIdlMap.containsKey(text);
        return IDLField(
          did: text,
          idl: isPrimType ? primIdlMap[text]! : '$text.idl',
          type: text,
          opt: node.optional,
          deser: isPrimType
              ? null
              : node.optional
                  ? "{{val}}==null?null:$text.fromMap({{val}})"
                  : "$text.fromMap({{val}})",
        );
      }
    } else if (ctx is VecTypeContext) {
      var field = _resolveTypeNode(node.children.first);
      var idlType = "IDL.Vec(${field.idl})";
      if (field.did == 'nat8' || field.did == 'int8') {
        var dartType = 'Uint8List';
        return IDLField(
          did: ctx.text,
          type: dartType,
          idl: idlType,
          opt: node.optional,
          ser: node.optional
              ? "{{val}}?.toList(growable: false)"
              : "{{val}}.toList(growable: false)",
          deser: node.optional
              ? "{{val}}==null?null:$dartType.fromList({{val}})"
              : "$dartType.fromList({{val}})",
        );
      }
      var dartType = 'List<${field.type.opt(node.optional)}>';
      var ser = field.ser;
      if (ser != null) {
        ser =
            "{{val}}${node.optional ? '?' : ''}.map((dynamic e) => ${ser.replaceAll("{{val}}", "e")})";
      }
      var deser = field.deser;
      if (deser != null) {
        deser =
            "{{val}}${node.optional ? '?' : ''}.map((dynamic e) => ${deser.replaceAll("{{val}}", "e")}).toList(growable: false)";
      }
      return IDLField(
        did: ctx.text,
        idl: idlType,
        type: dartType,
        opt: node.optional,
        ser: ser,
        deser: deser,
      );
    } else if (ctx is RecordTypeContext || ctx is VariantTypeContext) {
      var fields = node.children.map((e) => _resolveTypeNode(e.children.first));
      var idlTypes = fields.map((e) => e.idl).join(",");
      var dartTypes = fields.map((e) => e.type.opt(e.opt)).join(",");
      var deser = StringBuffer();
      var ser = StringBuffer();
      for (var i = 0; i < fields.length; ++i) {
        var f = fields.elementAt(i);
        var ind = i + 1;
        if (f.ser != null) {
          ser.write(f.deser!.replaceAll("{{val}}", "{{val}}.item$ind"));
        } else {
          ser.write("{{val}}.item$ind");
        }
        ser.write(",");

        if (f.deser != null) {
          deser.write(f.deser!.replaceAll("{{val}}", "{{val}}[$i]"));
        } else {
          deser.write("{{val}}[$i]");
        }
        deser.write(",");
      }
      return IDLField(
        did: ctx.text,
        idl: "IDL.Tuple([$idlTypes])",
        type: fields.length == 1
            ? dartTypes
            : "Tuple${fields.length}<$dartTypes>",
        opt: ctx is VariantTypeContext || node.optional,
        ser: "<dynamic>[$ser]",
        deser: "Tuple2<$dartTypes>.fromList([$deser])",
      );
    } else if (ctx is RefTypeContext) {}
    throw UnsupportedTypeContextException(ctx);
  }
}

class TypeNode {
  final RuleContext ctx;

  final TypeNode? parent;

  final bool optional;

  List<TypeNode>? _children;

  List<TypeNode> get children => _children ?? [];

  TypeNode(
    this.ctx, {
    this.parent,
    this.optional = false,
  }) {
    var _ctx = ctx;
    if (_ctx is DataTypeContext) {
      _setChildren([
        _ctx.idType(),
        _ctx.vecType(),
        _ctx.optType(),
        _ctx.variantType(),
        _ctx.recordType(),
        _ctx.refType(),
      ], optional);
    } else if (_ctx is VariantTypeContext) {
      _setChildren(_ctx.exprTypes(), true);
    } else if (_ctx is RecordTypeContext) {
      _setChildren(_ctx.exprTypes());
    } else if (_ctx is PairTypeContext) {
      _setChildren([_ctx.idType(), _ctx.dataType()]);
    } else if (_ctx is IdTypeContext) {
      _setChildren([_ctx.id(), _ctx.primType()]);
    } else if (_ctx is VecTypeContext) {
      _setChild(_ctx.dataType());
    } else if (_ctx is OptTypeContext) {
      _setChild(_ctx.dataType(), true);
    } else if (_ctx is TupleTypeContext) {
      _setChildren(_ctx.dataTypes());
    } else if (_ctx is ExprTypeContext) {
      _setChildren([
        _ctx.pairType(),
        _ctx.idType(),
        _ctx.vecType(),
        _ctx.optType(),
        _ctx.variantType(),
        _ctx.recordType(),
        _ctx.refType(),
      ], optional);
    } else if (_ctx is RefTypeContext) {
      // todo refType
    }
  }

  void _setChildren(List<RuleContext?> children, [bool optional = false]) {
    assert(_children == null);
    _children = children.whereType<RuleContext>().map<TypeNode>(
      (e) {
        return TypeNode(
          e,
          parent: this,
          optional: optional,
        );
      },
    ).toList(growable: false);
  }

  void _setChild(RuleContext? child, [bool optional = false]) {
    assert(_children == null);
    if (child != null) {
      _children = [TypeNode(child, parent: this, optional: optional)];
    }
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      "ctx": ctx.runtimeType.toString(),
      "text": ctx.text,
      "optional": optional,
      "children": children,
    };
  }
}

class IDLField {
  final String did;
  final String idl;
  final String type;
  final bool opt;
  final String? ser;
  final String? deser;

  IDLField({
    required this.did,
    required this.idl,
    required this.type,
    required this.opt,
    this.ser,
    this.deser,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "did": did,
      "idl": idl,
      "type": type,
      "opt": opt,
      if (ser != null) "ser": ser,
      if (deser != null) "deser": deser,
    };
  }
}

class ClassField extends Comparable<ClassField> {
  final String id;
  final String did;
  final String type;
  final String idl;
  final bool obj;
  final bool opt;
  final String? ser;
  final String? deser;

  ClassField({
    required this.id,
    required this.did,
    required this.type,
    required this.idl,
    required this.obj,
    required this.opt,
    this.ser,
    this.deser,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "did": did,
      "type": type,
      "idl": idl,
      "obj": obj,
      "opt": opt,
      if (ser != null) "ser": ser,
      if (deser != null) "deser": deser,
    };
  }

  @override
  int compareTo(ClassField other) {
    return !opt && !other.opt
        ? 0
        : opt
            ? 1
            : -1;
  }
}

class ClassRender {
  static renderToJsonFields(Iterable<ClassField> fields) {
    return (LambdaContext _) => fields.map((e) {
          var arg = e.ser == null
              ? e.id.camelCase
              : e.ser!.replaceAll("{{val}}", e.id.camelCase);
          return "'${e.id}': $arg,";
        }).join("\n");
  }

  static renderRecordIDL(Iterable<ClassField> fields) {
    return (LambdaContext _) => """
      static final RecordClass idl = IDL.Record(<String, dynamic>{
        ${fields.map((e) => "'${e.id}': ${e.idl},").join("\n")}
      });
    """;
  }

  static renderVariantIDL(String type, Iterable<ClassField> fields) {
    // var defaultType = fields.isNotEmpty
    //     ? 'static const $type defaultType = $type(${fields.first.id.camelCase}: true);'
    //     : '';
    return (LambdaContext _) => """
    static final VariantClass idl = IDL.Variant(<String, CType<dynamic>>{
      ${fields.map((e) => "'${e.id}': ${e.idl},").join("\n")}
    });
    """;
  }

  static renderFromMapFields(bool isVariant, Iterable<ClassField> fields) {
    if (isVariant) {
      return (LambdaContext _) {
        return fields.map((e) {
          String deser;
          if (e.deser != null) {
            deser = e.deser!.replaceAll("{{val}}", "map['${e.id}']");
          } else if (e.obj) {
            if (e.opt) {
              deser =
                  "map.containsKey('${e.id}') ? ${e.type}.fromMap(map['${e.id}']) : null";
            } else {
              deser = "${e.type}.fromMap(map['${e.id}'])";
            }
          } else {
            deser = e.type == 'bool'
                ? "map.containsKey('${e.id}')"
                : "map['${e.id}']";
          }
          return "${e.id.camelCase}: $deser,";
        }).join("\n");
      };
    }
    return (LambdaContext _) => fields.map((e) {
          String deser;
          if (e.deser != null) {
            deser = e.deser!.replaceAll("{{val}}", "map['${e.id}']");
          } else if (e.obj) {
            if (e.opt) {
              deser =
                  "map.containsKey('${e.id}') ? ${e.type}.fromMap(map['${e.id}']) : null";
            } else {
              deser = "${e.type}.fromMap(map['${e.id}'])";
            }
          } else {
            deser = "map['${e.id}']";
          }
          return "${e.id.camelCase}: $deser,";
        }).join("\n");
  }

  static renderConstructorFields(Iterable<ClassField> fields) {
    return (LambdaContext _) => fields
        .map((e) => "${e.opt ? '' : 'required'} this.${e.id.camelCase},")
        .join("\n");
  }

  static renderFields(Iterable<ClassField> fields) {
    return (LambdaContext _) => fields
        .map((e) => "final ${e.type.opt(e.opt)} ${e.id.camelCase};")
        .join("\n");
  }
}

T ifSupport<T>(RuleContext ctx, Supplier<T?> support) {
  var t = support();
  if (t == null) {
    throw UnsupportedTypeContextException(ctx);
  }
  return t;
}

typedef Supplier<T> = T Function();

typedef Transform<T, R> = R Function(T e);

class UnsupportedTypeContextException implements Exception {
  final RuleContext ctx;

  const UnsupportedTypeContextException(this.ctx);

  @override
  String toString() {
    return "Unsupported type rule context `<${ctx.runtimeType}=${ctx.text}>`.";
  }
}

extension _ForTypeString on String {
  String opt(bool optional) {
    if (optional) {
      return "${this}?";
    }
    return this;
  }
}

typedef Name = int;

String codegen(String clazz, String contents) {
  CandidLexer.checkVersion();
  CandidParser.checkVersion();
  var input = InputStream.fromString(contents);
  var lexer = CandidLexer(input);
  var tokens = CommonTokenStream(lexer);
  var parser = CandidParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());
  parser.buildParseTree = true;
  var did = parser.did();
  var typeDef = TypeDefListener();
  ParseTreeWalker.DEFAULT.walk(typeDef, did);
  var classDef = ClassDefListener(typeDef.typeDefs, typeDef.primIdlMap);
  ParseTreeWalker.DEFAULT.walk(classDef, did);
  var idl = IDLListener(clazz, typeDef.typeDefs, typeDef.primIdlMap);
  ParseTreeWalker.DEFAULT.walk(idl, did);
  var formatter = DartFormatter();
  var code = Template(
    fileTpl,
    htmlEscapeValues: false,
  ).renderString({
    "idl": idl.idlCodes,
    "classes": classDef.classCodes,
  });
  code = formatter.format(code);
  return code;
}

const kPrimitiveTypeIDLMap = <String, String>{
  "empty": "IDL.Empty",
  "reserved": "IDL.Reserved",
  "bool": "IDL.Bool",
  "null": "IDL.Null",
  "text": "IDL.Text",
  "int": "IDL.Int",
  "int8": "IDL.Int8",
  "int16": "IDL.Int16",
  "int32": "IDL.Int32",
  "int64": "IDL.Int64",
  "nat": "IDL.Nat",
  "nat8": "IDL.Nat8",
  "nat16": "IDL.Nat16",
  "nat32": "IDL.Nat32",
  "nat64": "IDL.Nat64",
  "float32": "IDL.Float32",
  "float64": "IDL.Float64",
  "principal": "IDL.Principal",
};

const kIntDartMap = <String, String>{
  "int": "BigInt",
  "int8": "int",
  "int16": "int",
  "int32": "int",
  "int64": "BigInt",
  "nat": "BigInt",
  "nat8": "int",
  "nat16": "int",
  "nat32": "int",
  "nat64": "BigInt",
};

const kPrimitiveTypeDartMap = <String, String>{
  ...kIntDartMap,
  "bool": "bool",
  "text": "String",
  "float32": "double",
  "float64": "double",
  "principal": "Principal",
};
