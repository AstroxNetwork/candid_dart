import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';

import '../codegen.dart';
import '../consts.dart';
import '../entries.dart';
import '../extension.dart';
import '../serialize.dart';
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
            idlParams = "<dynamic>[${first.ser!.replaceAll(Ser.ph, "arg")},]";
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
                ser.write(f.ser!.replaceAll(Ser.ph, "args.item$ind"));
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
          "idlName": clazz,
          "idlMethodName": key.pascalCase,
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
              return "return ${deser.replaceAll(Ser.ph, "resp")};";
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
          deser = Ser.principal(node.optional).item2;
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
          deser: isPrimType ? null : Ser.obj(text, node.optional).item2,
        );
      }
    } else if (ctx is VecTypeContext) {
      var field = _resolveTypeNode(node.children.first);
      var idlType = "IDL.Vec(${field.idl},)";
      if (field.did == 'nat8' || field.did == 'int8') {
        var dartType = 'Uint8List';
        var ser = Ser.uint8List(node.optional);
        return IDLField(
          did: ctx.text,
          type: dartType,
          idl: idlType,
          opt: node.optional,
          ser: ser.item1,
          deser: ser.item2,
        );
      }
      var dartType = 'List<${field.type.opt(field.opt)}>';
      var sers = Ser.list(field, node.optional);
      return IDLField(
        did: ctx.text,
        idl: idlType,
        type: dartType,
        opt: node.optional,
        ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is RecordTypeContext || ctx is VariantTypeContext) {
      var fields = node.children.map((e) => _resolveTypeNode(e.children.first));
      var tuple4 = Ser.tuple(fields);
      return IDLField(
        did: ctx.text,
        idl: tuple4.item4,
        type: tuple4.item3,
        opt: node.optional,
        ser: tuple4.item1,
        deser: tuple4.item2,
      );
    } else if (ctx is RefTypeContext) {}
    throw UnsupportedTypeContextException(ctx);
  }
}
