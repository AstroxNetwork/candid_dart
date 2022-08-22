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

class ClassDefParser extends CandidBaseListener {
  ClassDefParser(this.defTypes, this.primitiveIdlMap);

  final Set<String> defTypes;
  final Map<String, String> primitiveIdlMap;
  final StringBuffer _sb = StringBuffer();
  final Map<String, Tuple4<String, String, String, String>> tupleTypes = {};

  String get classCodes => _sb.toString();

  @override
  void enterDef(DefContext ctx) {
    final type = ctx.idType()!.text;
    final node = TypeNode(ctx.dataType()!);
    final first = node.children.first;
    if (first.ctx is IdTypeContext) {
      final id = first.ctx.text;
      _sb.writeln(
        '/// [$type] defined in Candid: '
        '${ctx.text}\ntypedef $type = ${kPrimitiveTypeDartMap[id] ?? id};',
      );
      return;
    }
    _eachNode(node, type);
  }

  void _eachNode(TypeNode node, String type) {
    final children = node.children;
    final ctx = node.ctx;
    if (ctx is RecordTypeContext) {
      final hasKey =
          node.children.every((e) => e.children.first.ctx is PairTypeContext);
      if (!hasKey) {
        final fields = node.children
            .map((e) => _resolveTypeNode(e.children.first, '', type));
        final tuple = SerField.tuple(fields);
        _sb.writeln(
          '/// [$type] defined in Candid\n'
          '/// ${ctx.text}\ntypedef $type = ${tuple.item3};',
        );
        tupleTypes[type] = SerField.tuple(
          fields,
          type: type,
          nullable: node.nullable,
        );
      } else {
        _resolveClassType(node, type);
      }
    } else if (ctx is VariantTypeContext) {
      _resolveClassType(node, type);
    } else if (ctx is PairTypeContext) {
      type = type + ctx.idType()!.text.pascalCase;
    }
    for (final child in children) {
      _eachNode(child, type);
    }
  }

  void _resolveClassType(TypeNode node, String type) {
    final fields = node.children.map<SerField>((e) {
      final child = e.children.first;
      final ctx = child.ctx;
      if (ctx is IdTypeContext) {
        final id = ctx.text;
        return SerField(
          id: id,
          did: id,
          type: 'bool',
          idl: 'IDL.Null',
          nullable: false,
        );
      } else if (ctx is PairTypeContext) {
        final id = ctx.idType()!.text;
        final dataTypeChildNode = child.children.last.children.first;
        return _resolveTypeNode(dataTypeChildNode, id, type);
      }
      throw UnsupportedTypeContextException(ctx);
    }).toList(growable: false);
    final isVariant = node.ctx is VariantTypeContext;
    final clazz = Template(clazzTpl).renderString({
      'clazz': type,
      'variant': isVariant,
      'renderClassComment': ClassRender.renderClassComment(type, node.ctx.text),
      'renderFields': ClassRender.renderFields(fields),
      'renderConstructorFields': ClassRender.renderConstructorFields(fields),
      'renderFromMapFields': ClassRender.renderFromMapFields(fields),
      'renderIDL': isVariant
          ? ClassRender.renderVariantIDL(type, fields)
          : ClassRender.renderRecordIDL(fields),
      'renderToJsonFields': ClassRender.renderToJsonFields(fields),
      'renderToString': ClassRender.renderToString(),
      'renderEquals': ClassRender.renderEquals(type, fields),
      'renderHashCode': ClassRender.renderHashCode(fields),
      'renderCopy': ClassRender.renderCopy(type, fields),
    });
    _sb.writeln(clazz);
  }

  SerField _resolveTypeNode(
    TypeNode node,
    String id,
    String type,
  ) {
    final ctx = node.ctx;
    if (ctx is IdTypeContext) {
      final text = ctx.text;
      final dartType = kPrimitiveTypeDartMap[text];
      final idlType = kPrimitiveTypeIDLMap[text];
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
          id: id,
          did: text,
          type: dartType,
          idl: idlType,
          nullable: node.nullable,
          // ser: sers?.item1,
          deser: sers?.item2,
        );
      }
      if (tupleTypes.containsKey(text)) {
        final tuple4 = tupleTypes[text]!;
        return SerField(
          id: id,
          did: ctx.text,
          idl: tuple4.item4,
          type: text,
          nullable: node.nullable,
          ser: tuple4.item1,
          deser: tuple4.item2,
        );
      }
      if (defTypes.contains(text)) {
        final isPrimitiveType = primitiveIdlMap.containsKey(text);
        Tuple2<String, String>? sers;
        if (isPrimitiveType) {
          final idl = primitiveIdlMap[text]!;
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
          id: id,
          did: text,
          type: text,
          idl: isPrimitiveType ? primitiveIdlMap[text]! : '$text.idl',
          nullable: node.nullable,
          // ser: sers?.item1,
          deser: sers?.item2,
        );
      }
      return SerField(
        id: id,
        did: text,
        type: 'bool',
        idl: 'IDL.Null',
        nullable: false,
      );
    } else if (ctx is PairTypeContext) {
      final key = node.children.first;
      final ser = _resolveTypeNode(node.children.last, id, type);
      return SerField(
        id: key.ctx.text,
        idl: ser.idl,
        type: ser.type,
        did: ctx.text,
        nullable: ser.nullable,
        ser: ser.ser,
        deser: ser.deser,
      );
    } else if (ctx is OptTypeContext) {
      final child = node.children.first.children.first;
      final field = _resolveTypeNode(child, id, type);
      final sers = SerField.opt(ser: field.ser, deser: field.deser);
      return SerField(
        id: field.id,
        did: ctx.text,
        type: field.type,
        idl: 'IDL.Opt(${field.idl},)',
        nullable: field.nullable,
        ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is VecTypeContext) {
      final child = node.children.first.children.first;
      final field = _resolveTypeNode(child, id, type);
      final idlType = 'IDL.Vec(${field.idl},)';
      if (field.did == 'nat8' || field.did == 'int8') {
        final dartType = 'Uint8List';
        final ser = SerField.uint8List(node.nullable);
        return SerField(
          id: field.id,
          did: ctx.text,
          type: dartType,
          idl: idlType,
          nullable: node.nullable,
          // ser: ser.item1,
          deser: ser.item2,
        );
      }
      final dartType = 'List<${field.type.nullable(field.nullable)}>';
      final sers = SerField.list(field, node.nullable);
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
      final newType = type + id.pascalCase;
      if (ctx is RecordTypeContext) {
        final hasKey = node.children.every(
          (e) => e.children.first.ctx is PairTypeContext,
        );
        if (!hasKey) {
          final fields = node.children.map(
            (e) => _resolveTypeNode(e.children.first, id, type),
          );
          final tuple4 = SerField.tuple(fields, nullable: node.nullable);
          return SerField(
            id: id,
            did: ctx.text,
            idl: tuple4.item4,
            type: tuple4.item3,
            nullable: node.nullable,
            ser: tuple4.item1,
            deser: tuple4.item2,
          );
        }
      }
      final sers = SerField.object(newType, node.nullable);
      return SerField(
        id: id,
        did: ctx.text,
        type: newType,
        idl: '$newType.idl',
        nullable: node.nullable,
        // ser: sers.item1,
        deser: sers.item2,
      );
    } else if (ctx is RefTypeContext) {
      // TODO: Handle RefTypeContext or remove the condition.
    }
    throw UnsupportedTypeContextException(ctx);
  }
}
