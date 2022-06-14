import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';
import 'package:tuple/tuple.dart';

import '../codegen.dart';
import '../consts.dart';
import '../extension.dart';
import '../serialize.dart';
import '../templates.dart';
import '../type_node.dart';

class IDLParser extends CandidBaseListener {
  final String clazz;
  final Set<String> defTypes;
  final Map<String, String> primIdlMap;
  final Map<String, Tuple4<String, String, String, String>> tupleTypes;
  String _idlCodes = "";

  String get idlCodes => _idlCodes;

  IDLParser(
    this.clazz,
    this.defTypes,
    this.primIdlMap,
    this.tupleTypes,
  );

  @override
  void enterActor(ActorContext ctx) {
    var methTypes = ctx.actorType()?.methTypes() ?? [];
    var keys = StringBuffer();
    var idlMethods = StringBuffer();
    var reqMethods = StringBuffer();
    for (var md in methTypes) {
      var key = md.idType(0)!.text;
      var ccKey = key.camelCase;
      keys.writeln(
          "/// ${md.text}\nstatic const String $ccKey = '$key';");
      var body = md.funcType();
      if (body != null) {
        var ann = body.funcAnn()?.text;
        var args = body.tupleType(0)!;
        var returns = body.tupleType(1)!;
        var argNodes = TypeNode(args);
        var returnNodes = TypeNode(returns);
        var argFields = _resolveTupleNode(argNodes);
        var returnFields = _resolveTupleNode(returnNodes);
        var idlValue = {
          'didText': md.text,
          'idlName': ccKey,
          'idlReq': argFields.map((e) => e.idl).join(","),
          'idlRep': returnFields.map((e) => e.idl).join(","),
          'funcAnno': ann.isNotBlank ? "'$ann'" : '',
        };
        String params;
        String idlParams;
        var argFieldsLen = argFields.length;
        if (argFields.isEmpty) {
          params = '';
          idlParams = 'const <dynamic>[]';
        } else if (argFieldsLen == 1) {
          var first = argFields.first;
          params = '${first.type.nullable(first.nullable)} arg,';
          if (first.ser != null) {
            idlParams =
                "<dynamic>[${first.ser!.replaceAll(SerField.ph, "arg")},]";
          } else {
            idlParams = "<dynamic>[arg]";
          }
        } else {
          params =
              'Tuple$argFieldsLen<${argFields.map((e) => e.type.nullable(e.nullable)).join(",")}> args,';
          if (argFields.any((e) => e.ser != null)) {
            var ser = StringBuffer();
            for (var i = 0; i < argFieldsLen; ++i) {
              var f = argFields.elementAt(i);
              var ind = i + 1;
              if (f.ser != null) {
                ser.write(f.ser!.replaceAll(SerField.ph, "args.item$ind"));
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
        var returnFieldsLen = returnFields.length;
        var noReturn = returnFieldsLen == 0;
        reqMethods.writeln(Template(
          idlReqMethod,
          htmlEscapeValues: false,
        ).renderString({
          ...idlValue,
          "methodName": ccKey,
          "renderParams": (_) => params,
          "renderParamsName": (_) => idlParams,
          "idlName": clazz,
          "hasReturn": !noReturn,
          "returnType": noReturn
              ? 'void'
              : returnFieldsLen == 1
                  ? returnFields.first.type
                      .nullable(returnFields.first.nullable)
                  : "Tuple$returnFieldsLen<${returnFields.map((e) => e.type.nullable(e.nullable)).join(",")}>",
          "renderReturn": (_) {
            if (noReturn) {
              return '';
            }
            if (returnFieldsLen == 1) {
              var deser = returnFields.first.deser;
              if (deser != null) {
                return "return ${deser.replaceAll(SerField.ph, "resp")};";
              }
            } else if (returnFieldsLen > 1) {
              var sb = StringBuffer();
              for (var i = 0; i < returnFieldsLen; ++i) {
                var field = returnFields[i];
                if (field.deser != null) {
                  sb.write(field.deser!.replaceAll(SerField.ph, "resp[$i]"));
                } else {
                  sb.write("resp[$i]");
                }
                sb.write(",");
              }
              return "return Tuple$returnFieldsLen($sb);";
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

  List<SerField> _resolveTupleNode(TypeNode node) {
    return node.children
        .map((e) => _resolveTypeNode(e))
        .toList(growable: false);
  }

  SerField _resolveTypeNode(TypeNode node) {
    var ctx = node.ctx;
    if (ctx is ExprTypeContext || ctx is DataTypeContext) {
      return _resolveTypeNode(node.children.first);
    } else if (ctx is OptTypeContext) {
      var field = _resolveTypeNode(node.children.first);
      var sers = SerField.opt(ser: field.ser, deser: field.deser);
      return SerField(
        did: ctx.text,
        idl: "IDL.Opt(${field.idl},)",
        type: field.type,
        nullable: field.nullable,
        ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is PairTypeContext) {
      var id = node.children.first;
      var ser = _resolveTypeNode(node.children.last);
      return SerField(
        id: id.ctx.text,
        idl: ser.idl,
        type: ser.type,
        did: ctx.text,
        nullable: ser.nullable,
        ser: ser.ser,
        deser: ser.deser,
      );
    } else if (ctx is IdTypeContext) {
      var text = ctx.text;
      var dartType = kPrimitiveTypeDartMap[text];
      var idlType = kPrimitiveTypeIDLMap[text];
      if (dartType != null && idlType != null) {
        Tuple2<String, String>? sers;
        if (idlType == 'IDL.Principal') {
          sers = SerField.principal(node.nullable);
        } else if (dartType == 'Uint8List') {
          sers = SerField.uint8List(node.nullable);
        } else if (dartType == 'BigInt') {
          sers = SerField.bigInt(node.nullable);
        }
        return SerField(
          did: text,
          idl: idlType,
          type: dartType,
          nullable: node.nullable,
          // ser: sers?.item1,
          deser: sers?.item2,
        );
      }
      if (tupleTypes.containsKey(text)) {
        var tuple4 = tupleTypes[text]!;
        return SerField(
          did: ctx.text,
          idl: tuple4.item4,
          type: tuple4.item3,
          nullable: node.nullable,
          ser: tuple4.item1,
          deser: tuple4.item2,
        );
      }
      if (defTypes.contains(text)) {
        var isPrimType = primIdlMap.containsKey(text);
        Tuple2<String, String>? sers;
        if (isPrimType) {
          var idl = primIdlMap[text]!;
          if (idl == 'IDL.Vec(IDL.Nat8)') {
            sers = SerField.uint8List(node.nullable);
          } else if (['IDL.Int', 'IDL.Int64', 'IDL.Nat', 'IDL.Nat64']
              .contains(idl)) {
            sers = SerField.bigInt(node.nullable);
          } else {
            sers = null;
          }
        } else {
          sers = SerField.object(text, node.nullable);
        }
        return SerField(
          did: text,
          idl: isPrimType ? primIdlMap[text]! : '$text.idl',
          type: text,
          nullable: node.nullable,
          // ser: sers?.item1,
          deser: sers?.item2,
        );
      }
    } else if (ctx is VecTypeContext) {
      var field = _resolveTypeNode(node.children.first);
      var idlType = "IDL.Vec(${field.idl},)";
      if (field.did == 'nat8' || field.did == 'int8') {
        var dartType = 'Uint8List';
        var ser = SerField.uint8List(node.nullable);
        return SerField(
          did: ctx.text,
          type: dartType,
          idl: idlType,
          nullable: node.nullable,
          // ser: ser.item1,
          deser: ser.item2,
        );
      }
      var dartType = 'List<${field.type.nullable(field.nullable)}>';
      var sers = SerField.list(field, node.nullable);
      return SerField(
        did: ctx.text,
        idl: idlType,
        type: dartType,
        nullable: node.nullable,
        ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is RecordTypeContext || ctx is VariantTypeContext) {
      var fields = node.children.map((e) => _resolveTypeNode(e.children.first));
      var tuple4 = SerField.tuple(fields);
      return SerField(
        did: ctx.text,
        idl: tuple4.item4,
        type: tuple4.item3,
        nullable: node.nullable,
        ser: tuple4.item1,
        deser: tuple4.item2,
      );
    } else if (ctx is RefTypeContext) {}
    throw UnsupportedTypeContextException(ctx);
  }
}
