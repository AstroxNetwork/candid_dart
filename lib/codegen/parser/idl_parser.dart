import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:candid_dart/codegen/extension.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';

import '../codegen.dart';
import '../consts.dart';
import '../entries.dart';
import '../templates.dart';

class IDLParser extends CandidBaseListener {
  final String clazz;
  final Set<String> defTypes;
  final Map<String, String> primIdlMap;
  String _idlCodes = "";

  String get idlCodes => _idlCodes;

  IDLParser(
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
        idl: "IDL.Opt(${field.idl},)",
        type: field.type,
        opt: true,
        ser: field.ser,
        deser: field.deser,
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
                  ? "{{val}}==null?null:$text.fromMap({{val}},)"
                  : "$text.fromMap({{val}},)",
        );
      }
    } else if (ctx is VecTypeContext) {
      var field = _resolveTypeNode(node.children.first);
      var idlType = "IDL.Vec(${field.idl},)";
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
            "{{val}}${node.optional ? '?' : ''}.map((dynamic e) => ${ser.replaceAll("{{val}}", "e")},)";
      }
      var deser = field.deser;
      if (deser != null) {
        deser =
            "{{val}}${node.optional ? '?' : ''}.map((dynamic e) => ${deser.replaceAll("{{val}}", "e")},).toList(growable: false)";
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
        idl: "IDL.Tuple(<CType<dynamic>>[$idlTypes],)",
        type: fields.length == 1
            ? dartTypes
            : "Tuple${fields.length}<$dartTypes>",
        opt: ctx is VariantTypeContext || node.optional,
        ser: "<dynamic>[$ser]",
        deser: "Tuple${fields.length}<$dartTypes>.fromList(<dynamic>[$deser],)",
      );
    } else if (ctx is RefTypeContext) {}
    throw UnsupportedTypeContextException(ctx);
  }
}
