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
      var ccKey = key.camelCase;
      keys.writeln("/// ${md.text}\nstatic const String $ccKey = '${md.getChild(0)?.text}';");
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
          'didText': md.text,
          'idlName': ccKey,
          'idlReq': argsField.map((e) => e.idl).join(","),
          'idlRep': returnsField.map((e) => e.idl).join(","),
          'funcAnno': ann.isNotBlank ? "'$ann'" : '',
        };
        String params;
        String idlParams;
        if (argsField.isEmpty) {
          params = '';
          idlParams = 'const <dynamic>[]';
        } else if (argsField.length == 1) {
          var first = argsField.first;
          params = '${first.type.nullable(first.nullable)} arg,';
          if (first.ser != null) {
            idlParams =
                "<dynamic>[${first.ser!.replaceAll(SerField.ph, "arg")},]";
          } else {
            idlParams = "<dynamic>[arg]";
          }
        } else {
          params =
              'Tuple${argsField.length}<${argsField.map((e) => e.type.nullable(e.nullable)).join(",")}> args,';
          if (argsField.any((e) => e.ser != null)) {
            var ser = StringBuffer();
            for (var i = 0; i < argsField.length; ++i) {
              var f = argsField.elementAt(i);
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
        var noReturn = returnsField.isEmpty;
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
              : returnsField.length == 1
                  ? returnsField.first.type
                      .nullable(returnsField.first.nullable)
                  : throw 'Return has more than one type.',
          "renderReturn": (_) {
            if (noReturn) {
              return '';
            }
            var deser = returnsField.first.deser;
            if (deser != null) {
              return "return ${deser.replaceAll(SerField.ph, "resp")};";
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
      if (defTypes.contains(text)) {
        var isPrimType = primIdlMap.containsKey(text);
        var sers = isPrimType ? null : SerField.object(text, node.nullable);
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
          ser: ser.item1,
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
