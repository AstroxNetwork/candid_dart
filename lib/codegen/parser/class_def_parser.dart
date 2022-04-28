import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';

import '../codegen.dart';
import '../consts.dart';
import '../extension.dart';
import '../serialize.dart';
import '../templates.dart';
import '../type_node.dart';

class ClassDefParser extends CandidBaseListener {
  ClassDefParser(this.defTypes, this.primIdlMap);

  final Set<String> defTypes;
  final Map<String, String> primIdlMap;
  final StringBuffer _sb = StringBuffer();
  final Map<String, List<SerField>> classFields = {};

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
    var fields = node.children.map<SerField>((e) {
      var child = e.children.first;
      var ctx = child.ctx;
      if (ctx is IdTypeContext) {
        var id = ctx.text;
        return SerField(
          id: id,
          did: id,
          type: 'bool',
          idl: 'IDL.Null',
          nullable: true,
        );
      } else if (ctx is PairTypeContext) {
        var id = ctx.idType()!.text;
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

  SerField _resolveTypeNode(
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
          deser = SerField.principal(node.nullable).item2;
        } else if (dartType == 'BigInt') {
          deser = SerField.bigInt(node.nullable).item2;
        }
        return SerField(
          id: id,
          did: text,
          type: dartType,
          idl: idlType,
          nullable: node.nullable,
          deser: deser,
        );
      }
      if (defTypes.contains(text)) {
        var isPrimType = primIdlMap.containsKey(text);
        return SerField(
          id: id,
          did: text,
          type: text,
          idl: isPrimType ? primIdlMap[text]! : '$text.idl',
          nullable: node.nullable,
          deser: isPrimType ? null : SerField.obj(text, node.nullable).item2,
        );
      }
      return SerField(
        id: id,
        did: text,
        type: 'bool',
        idl: 'IDL.Null',
        nullable: true,
      );
    } else if (ctx is OptTypeContext) {
      var child = node.children.first.children.first;
      var field = _resolveTypeNode(child, id, type);
      var sers = SerField.opt(field);
      return SerField(
        id: field.id,
        did: ctx.text,
        type: field.type,
        idl: "IDL.Opt(${field.idl},)",
        nullable: field.nullable,
        ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is VecTypeContext) {
      var child = node.children.first.children.first;
      var field = _resolveTypeNode(child, id, type);
      var idlType = "IDL.Vec(${field.idl},)";
      if (field.did == 'nat8' || field.did == 'int8') {
        var dartType = 'Uint8List';
        var ser = SerField.uint8List(node.nullable);
        return SerField(
          id: field.id,
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
        id: field.id,
        did: ctx.text,
        type: dartType,
        idl: idlType,
        nullable: node.nullable,
        ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is VariantTypeContext || ctx is RecordTypeContext) {
      var newType = type + id.pascalCase;
      var deser = SerField.obj(newType, node.nullable).item2;
      return SerField(
        id: id,
        did: ctx.text,
        type: newType,
        idl: "$newType.idl",
        nullable: node.nullable,
        deser: deser,
      );
    } else if (ctx is RefTypeContext) {}

    throw UnsupportedTypeContextException(ctx);
  }
}
