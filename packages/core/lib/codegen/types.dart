// ignore_for_file: must_be_immutable

import 'package:antlr4/antlr4.dart';
import 'package:recase/recase.dart';

import '../antlr/CandidParser.dart';
import 'consts.dart';
import 'extension.dart';
import 'visitor.dart';

abstract class IDLType<T extends RuleContext> {
  IDLType(this.ctx);

  static const String ph = '@';

  final T ctx;

  String? get id => null;

  String get idlType;

  String dartType({bool nullable = false});

  String get did => ctx.text;

  late final String doc =
      "/// ```Candid\n${did.split("\n").map((e) => "///   $e").join("\n")}\n/// ```";

  String get type;

  bool get serializable;

  String? serialize({required bool fromIDL, bool nullable = false}) {
    return null;
  }

  String? deserialize({required bool fromIDL, bool nullable = false}) {
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IDLType && runtimeType == other.runtimeType && did == other.did;

  @override
  int get hashCode => did.hashCode;
}

class PrimType extends IDLType<PrimTypeContext> {
  PrimType(super.ctx);

  @override
  String get did => ctx.text;

  @override
  String get idlType {
    return kPrimitiveTypeIDLMap[ctx.text]!;
  }

  @override
  String dartType({bool nullable = false}) {
    return kPrimitiveTypeDartMap[ctx.text].toString().nullable(nullable);
  }

  @override
  String get type => kPrimitiveTypeIDLClassMap[ctx.text]!;

  @override
  bool get serializable => true;

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    final principalType = ctx.principalType();
    if (principalType != null) {
      String d = 'Principal.from(${IDLType.ph})';
      if (nullable) {
        d = '${IDLType.ph} == null ? null : $d';
      }
      return d;
    }
    if (ctx.blobType() != null) {
      String d = '${IDLType.ph} is Uint8List '
          '? ${IDLType.ph} '
          ': Uint8List.fromList((${IDLType.ph} as List).cast())';
      if (nullable) {
        d = '${IDLType.ph} == null ? null : $d';
      }
      return d;
    }
    if (kBigIntIDLTypes.contains(did)) {
      String d = '${IDLType.ph} is BigInt ? ${IDLType.ph} ';
      if (fromIDL) {
        d += ': BigInt.from(${IDLType.ph})';
      } else {
        d += ': ${IDLType.ph} is num '
            '? BigInt.from(${IDLType.ph}) '
            ": BigInt.parse('\${${IDLType.ph}}')";
      }
      if (nullable) {
        d = '${IDLType.ph} == null ? null : $d';
      }
      return d;
    }
    return IDLType.ph;
  }

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return IDLType.ph;
  }
}

class IdType extends IDLType<IdTypeContext> {
  IdType(super.ctx, this.child);

  final IDLType child;

  @override
  String? get id => child.id;

  @override
  String get idlType => child.idlType;

  bool get isObj => child is Id && (child as Id).isObj;

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    _dartType ??= child.dartType(nullable: nullable);
    return _dartType!;
  }

  @override
  String get type => child.type;

  @override
  bool get serializable => child.serializable;

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return child.serialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    return child.deserialize(fromIDL: fromIDL, nullable: nullable);
  }
}

class Id extends IDLType<IdContext> {
  Id(super.ctx, this.sers);

  final Map<String, SerFactory> sers;

  @override
  String get id => ctx.text;

  bool get isObj => _raw?.isObj ?? false;

  String? _idlType;

  @override
  String get idlType {
    if (_idlType == null) {
      if (ctx.parent?.parent?.parent is VariantTypeContext) {
        _idlType = 'IDL.Null';
      } else {
        _idlType = '_$did';
      }
    }
    _idlType ??= ctx.parent?.parent?.parent is VariantTypeContext
        ? 'IDL.Null'
        : ctx.text.camelCase;
    return _idlType!;
  }

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    if (_dartType == null) {
      var text = ctx.text.pascalCase;
      if (kDartKeywordsAndInternalTypes.contains(text)) {
        text += '_';
      }
      _dartType = text.nullable(nullable);
    }
    return _dartType!;
  }

  @override
  String get type => did;

  Def? get _raw => sers[did]?.call();

  bool _serializable = true;

  bool __serializable = false;

  @override
  bool get serializable {
    if (!__serializable) {
      __serializable = true;
      _serializable = _raw?.serializable ?? true;
    }
    return _serializable;
  }

  final _ser = <bool, String?>{};
  final __ser = <bool, bool>{};

  bool get isOpt => _raw?.body.child is OptType;

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    if (!(__ser[fromIDL] ?? false)) {
      __ser[fromIDL] = true;
      final raw = _raw;
      if (raw is Def && raw.isObj) {
        _ser[fromIDL] = IDLType.ph;
      } else {
        _ser[fromIDL] = _raw?.serialize(fromIDL: fromIDL, nullable: nullable);
      }
    }
    return _ser[fromIDL];
  }

  final _deser = <bool, String?>{};
  final __deser = <bool, bool>{};

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    if (!(__deser[fromIDL] ?? false)) {
      __deser[fromIDL] = true;
      final raw = _raw;
      if (raw is Def && raw.isObj) {
        final method = fromIDL ? 'fromIDLDeserializable' : 'fromJson';
        String deser = '${raw.key.did.pascalCase}.$method(${IDLType.ph})';
        if (nullable) {
          deser = '${IDLType.ph} == null ? null : $deser';
        }
        _deser[fromIDL] = deser;
      } else {
        _deser[fromIDL] = _raw?.deserialize(
          fromIDL: fromIDL,
          nullable: nullable,
        );
      }
    }
    return _deser[fromIDL];
  }
}

abstract class NestedType<T extends RuleContext> extends IDLType {
  NestedType(super.ctx, this.child);

  final DataType child;

  @override
  bool get serializable => child.serializable;

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return child.serialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    return child.deserialize(fromIDL: fromIDL, nullable: nullable);
  }
}

class OptType extends NestedType<OptTypeContext> {
  OptType(OptTypeContext super.ctx, super.child);

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= 'IDL.Opt(${child.idlType},)';
    return _idlType!;
  }

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    _dartType ??= child.dartType(nullable: true);
    return _dartType!;
  }

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    final ser = child.serialize(fromIDL: fromIDL, nullable: true);
    const ns = 'if (${IDLType.ph} != null)';
    if (fromIDL) {
      return ser != null ? '[$ns $ser]' : '[$ns ${IDLType.ph}]';
    } else {
      return ser;
    }
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    if (fromIDL) {
      final deser = child.deserialize(fromIDL: fromIDL, nullable: true);
      if (deser != null) {
        return "(${IDLType.ph} as List).map((e) { return ${deser.replaceAll(IDLType.ph, 'e')}; }).firstOrNull";
      } else {
        return '(${IDLType.ph} as List).firstOrNull';
      }
    } else {
      final deser = child.deserialize(fromIDL: fromIDL, nullable: false);
      if (deser != null && child.child is VecType) {
        return '(${IDLType.ph} as List?)?.map((e) { return ${deser.replaceAll(IDLType.ph, 'e')}; }).toList()';
      }
      return IDLType.ph;
    }
  }

  String? _did;

  @override
  String get did {
    _did ??= 'opt ${child.did}';
    return _did!;
  }

  @override
  String get type => 'OptClass';
}

class VecType extends NestedType<VecTypeContext> {
  VecType(VecTypeContext super.ctx, super.child);

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= 'IDL.Vec(${child.idlType},)';
    return _idlType!;
  }

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    if (_dartType == null) {
      if (isUint8List) {
        _dartType = 'Uint8List'.nullable(nullable);
      } else {
        final dartType = child.dartType();
        _dartType = 'List<$dartType>'.nullable(nullable);
      }
    }
    return _dartType!;
  }

  String? _did;

  @override
  String get did {
    _did ??= 'vec ${child.did}';
    return _did!;
  }

  @override
  String get type => 'VecClass';

  bool get isUint8List => child.did == 'nat8' || child.did == 'int8';

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    var s = child.serialize(fromIDL: fromIDL);
    final isOpt = ctx.parent?.parent is OptTypeContext;
    if (isOpt) {
      nullable = false;
    }
    if (s != null && s != IDLType.ph) {
      final isParentVariant = ctx.parent?.parent?.parent?.parent?.parent?.parent
          is VariantTypeContext;
      String call = '.map';
      if (!fromIDL && isOpt && !isParentVariant) {
        call = '?$call';
      }
      s = '${IDLType.ph}$call((e) { '
          "return ${s.replaceAll(IDLType.ph, "e")};"
          ' }).toList()';
    }
    return s;
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    if (isUint8List) {
      const deser = '${IDLType.ph} is Uint8List '
          '? ${IDLType.ph} '
          ': Uint8List.fromList((${IDLType.ph} as List).cast())';
      return nullable ? '${IDLType.ph} == null ? null : $deser' : deser;
    }
    final isOpt = ctx.parent?.parent is OptTypeContext;
    String? d = child.deserialize(fromIDL: fromIDL, nullable: false);
    if (d != null && d != IDLType.ph) {
      if (nullable) {
        if (fromIDL || !isOpt) {
          d = "(${IDLType.ph} as List?)?.map((e) { return ${d.replaceAll(IDLType.ph, "e")}; }).toList()";
        } else {
          d = '${IDLType.ph} != null ? $d : null';
        }
      } else {
        if (fromIDL) {
          d = "(${IDLType.ph} as List).map((e) { return ${d.replaceAll(IDLType.ph, "e")}; }).toList()";
        } else if (!isOpt ||
            (child.child is! IdType && child.child is! RecordType)) {
          d = '(${IDLType.ph} as List).cast()';
        }
      }
    } else if (d == null || d == IDLType.ph) {
      final castType = child.dartType(nullable: nullable);
      if (nullable) {
        if (fromIDL) {
          d = '(${IDLType.ph} as List?)?.cast<$castType>()';
        } else {
          d = '${IDLType.ph} != null ? $d : null';
        }
      } else {
        if (fromIDL) {
          d = '(${IDLType.ph} as List).cast<$castType>()';
        } else if (ctx.parent?.parent is OptTypeContext) {
          d = '$d as $castType';
        }
      }
    }
    return d;
  }
}

abstract class DelegateType<T extends RuleContext> extends IDLType {
  DelegateType(T super.ctx, this.child);

  final IDLType child;

  @override
  String get idlType => child.idlType;

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    _dartType ??= child.dartType(nullable: nullable);
    return _dartType!;
  }

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return child.serialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    return child.deserialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String get did => child.did;

  @override
  String? get id => child.id;

  @override
  String get type => child.type;

  @override
  bool get serializable => child.serializable;
}

class DataType extends DelegateType<DataTypeContext> {
  DataType(super.ctx, super.child);
}

class ExprType extends DelegateType<ExprTypeContext> {
  ExprType(super.ctx, super.child);
}

abstract class ObjectType<T extends RuleContext> extends IDLType<T> {
  ObjectType(super.ctx, this.children);

  final List<ExprType> children;

  bool get isEnum =>
      this is VariantType &&
      children.isNotEmpty &&
      children.every((e) => e.child is IdType);

  bool get isVariant => this is VariantType;

  @override
  String get did {
    throw UnimplementedError();
  }

  @override
  String get idlType {
    throw UnimplementedError();
  }

  @override
  bool get serializable => children.every((e) => e.serializable);

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    if (_dartType == null) {
      if (children.isEmpty) {
        _dartType = 'void';
      } else {
        _dartType = ctx.getClassName().nullable(nullable);
      }
    }
    return _dartType!;
  }
}

class RecordType extends ObjectType<RecordTypeContext> {
  RecordType(
    super.ctx,
    super.children,
  );

  String? _did;

  @override
  String get did {
    if (_did == null) {
      final fields = children.map((e) => e.did).join('; ');
      _did = 'record { $fields }';
    }
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    if (_idlType == null) {
      final sb = StringBuffer();
      if (isTupleValue) {
        for (final value in children) {
          sb.write('${value.idlType},');
        }
        _idlType = 'IDL.Tuple([$sb])';
      } else {
        for (final value in children) {
          sb.write("'${value.child.id}':${value.idlType},");
        }
        _idlType = 'IDL.Record({$sb})';
      }
    }
    return _idlType!;
  }

  late bool isTupleValue =
      children.every((element) => element.child is! PairType) ||
          (() {
            bool tuple = true;
            for (int i = 0; i < children.length; ++i) {
              final child = children[i].child;
              if (child is PairType) {
                if (child.key.did != i.toString()) {
                  tuple = false;
                  break;
                }
              } else {
                tuple = false;
                break;
              }
            }
            return tuple;
          }());

  @override
  String get type => isTupleValue ? 'TupleClass' : 'RecordClass';

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    if (isTupleValue) {
      final ser = StringBuffer();
      final nonnull = ctx.parent?.parent is OptTypeContext ? '!' : '';
      for (int i = 0; i < children.length; ++i) {
        final ind = i + 1;
        final child = children[i];
        final s = child.serialize(fromIDL: fromIDL);
        String r;
        if (s != null) {
          r = s.replaceAll(IDLType.ph, '${IDLType.ph}$nonnull.item$ind');
        } else {
          r = '${IDLType.ph}$nonnull.item$ind';
        }
        if (!fromIDL) {
          final type = child.dartType(nullable: nullable);
          final objectType = idlVisitor.objs[type];
          final isEnum = objectType?.isEnum ?? false;
          final isRecordClass =
              objectType is RecordType && !objectType.isTupleValue;
          if (isEnum || isRecordClass) {
            r += '.toJson()';
          } else if (type == 'BigInt' || type == 'Principal') {
            r += '.toString()';
          }
        }
        ser.write('$r,');
      }
      return '[$ser]';
    }
    return IDLType.ph;
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    String deser;
    if (isTupleValue) {
      final buffer = StringBuffer();
      for (var i = 0; i < children.length; ++i) {
        final d = children[i].deserialize(fromIDL: fromIDL);
        if (d != null) {
          buffer.write(d.replaceAll(IDLType.ph, '${IDLType.ph}[$i]'));
        } else {
          buffer.write('${IDLType.ph}[$i]');
        }
        buffer.write(',');
      }
      deser = '${ctx.getClassName()}($buffer)';
    } else {
      final method = fromIDL ? 'fromIDLDeserializable' : 'fromJson';
      deser = '${ctx.getClassName()}.$method(${IDLType.ph},)';
    }
    if (nullable) {
      deser = '${IDLType.ph} == null ? null : $deser';
    }
    return deser;
  }
}

class VariantType extends ObjectType<VariantTypeContext> {
  VariantType(
    super.ctx,
    super.children,
  );

  String? _did;

  @override
  String get did {
    if (_did == null) {
      final fields = children.map((e) => e.did).join('; ');
      _did = 'variant { $fields }';
    }
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    if (_idlType == null) {
      final sb = StringBuffer();
      for (final value in children) {
        final child = value.child;
        sb.write("'${child.id}':${child.idlType},");
      }
      _idlType = 'IDL.Variant({$sb})';
    }
    return _idlType!;
  }

  @override
  String get type => 'VariantClass';

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return IDLType.ph;
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    final method = fromIDL ? 'fromIDLDeserializable' : 'fromJson';
    String deser = '${ctx.getClassName()}.$method(${IDLType.ph},)';
    if (nullable) {
      deser = '${IDLType.ph} == null ? null : $deser';
    }
    return deser;
  }
}

class PairType extends IDLType<PairTypeContext> {
  PairType(super.ctx, this.key, this.value);

  final IdType key;
  final DataType value;

  String? _id;

  @override
  String? get id {
    _id ??= key.did;
    return _id!;
  }

  String? _did;

  @override
  String get did {
    _did ??= '${key.did}: ${value.did}';
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= value.idlType;
    return _idlType!;
  }

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    _dartType ??= nullable ? '${value.dartType()}?' : value.dartType();
    return _dartType!;
  }

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return value.serialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    return value.deserialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String get type => value.type;

  @override
  bool get serializable => value.serializable;
}

class Actor extends IDLType<ActorContext> {
  Actor(super.ctx, this.key, this.init, this.body)
      : assert(body is ActorType || body is IdType);

  final IdType? key;
  final TupleType? init;
  final IDLType body;

  bool isRef() => body is IdType;

  String? _did;

  @override
  String get did {
    _did ??=
        "service ${key?.did ?? ''}: ${init == null ? '' : '${init!.did} -> '}${body.did}";
    return _did!;
  }

  @override
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  String get idlType => throw UnimplementedError();

  @override
  String get type => body.type;

  @override
  bool get serializable => false;
}

class ActorType extends IDLType<ActorTypeContext> {
  ActorType(super.ctx, this.children);

  final List<MethType> children;

  String? _did;

  @override
  String get did {
    _did ??= '{\n${children.map((e) => "  ${e.did}").join(";\n")}\n}';
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    if (_idlType == null) {
      final sb = StringBuffer();
      for (final value in children) {
        sb.write('${value.idlType},');
      }
      _idlType = 'IDL.Service({\n$sb\n})';
    }
    return _idlType!;
  }

  @override
  // TODO: implement dartType
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  String get type => 'ServiceClass';

  @override
  bool get serializable => false;
}

class Def extends IDLType<DefContext> {
  Def(super.ctx, this.key, this.body);

  final IdType key;
  final DataType body;

  bool get isObj => body.child is ObjectType;

  String? _did;

  @override
  String get did {
    _did ??= 'type ${key.did} = ${body.did};';
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= body.idlType;
    return _idlType!;
  }

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    _dartType ??= body.dartType();
    return _dartType!;
  }

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    return body.serialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    return body.deserialize(fromIDL: fromIDL, nullable: nullable);
  }

  @override
  String get type => body.type;

  @override
  bool get serializable => body.serializable;
}

class TupleType extends ObjectType<TupleTypeContext> {
  TupleType(super.ctx, super.children);

  String? _did;

  @override
  String get did {
    _did ??= "(${children.map((e) => e.did).join(", ")})";
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= children.map((e) => e.idlType).join(',');
    return _idlType!;
  }

  @override
  String dartType({bool nullable = false}) {
    if (children.isEmpty) {
      return 'void';
    } else if (children.length == 1) {
      return children.first.dartType();
    }
    return ctx.getClassName();
  }

  @override
  String get type => 'TupleClass';

  @override
  bool get serializable => children.every((e) => e.serializable);

  @override
  String? serialize({required bool fromIDL, bool nullable = false}) {
    if (children.isEmpty) {
      return '[]';
    } else if (children.length == 1) {
      return '[${children.first.serialize(fromIDL: fromIDL)}]';
    }
    final method = fromIDL ? 'toIDLSerializable' : 'toJson';
    return '${IDLType.ph}.$method()';
  }

  @override
  String? deserialize({required bool fromIDL, bool nullable = false}) {
    if (children.isEmpty) {
      return '';
    } else if (children.length == 1) {
      return children.first.deserialize(fromIDL: fromIDL);
    }
    final method = fromIDL ? 'fromIDLDeserializable' : 'fromJson';
    return '${ctx.getClassName()}.$method(${IDLType.ph})';
  }
}

class FuncType extends IDLType<FuncTypeContext> {
  FuncType(super.ctx, this.args, this.ret, this.anno);

  final TupleType args;
  final TupleType ret;
  final FuncAnn? anno;

  String? _did;

  @override
  String get did {
    _did ??= "${args.did} -> ${ret.did}${anno == null ? '' : ' ${anno!.did}'}";
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    if (_idlType == null) {
      final aidl = args.idlType;
      final ridl = ret.idlType;
      _idlType =
          "IDL.Func([$aidl],[$ridl],[${anno == null ? '' : "'${anno!.did}'"}],)";
    }
    return _idlType!;
  }

  String? _dartType;

  @override
  String dartType({bool nullable = false}) {
    _dartType ??=
        "Future<${args.dartType().isNullOrBlank ? 'void' : args.dartType()}> Function(${ret.dartType()})";
    return _dartType!;
  }

  @override
  String get type => 'FuncClass';

  @override
  bool get serializable => false;
}

class MethType extends IDLType<MethTypeContext> {
  MethType(super.ctx, this.name, this.body)
      : assert(body is FuncType || body is IdType);
  final IdType name;
  final IDLType body;

  String? _did;

  @override
  String get did {
    _did ??= '${name.did}: ${body.did}';
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= "'${name.did}': ${body.idlType}";
    return _idlType!;
  }

  @override
  // TODO: implement dartType
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  String get type => body.type;

  @override
  bool get serializable => false;
}

class RefType extends IDLType<RefTypeContext> {
  RefType(super.ctx, this.child)
      : assert(child is FuncType || child is ActorType);
  final IDLType child;

  late bool isFunc = child is FuncType;

  late bool isActor = child is ActorType;

  String? _did;

  @override
  String get did {
    _did ??= isFunc
        ? 'func ${child.did}'
        : isActor
            ? 'service ${child.did}'
            : throw UnimplementedError();
    return _did!;
  }

  String? _idlType;

  @override
  String get idlType {
    _idlType ??= child.idlType;
    return _idlType!;
  }

  @override
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  String get type => isFunc
      ? 'FuncClass'
      : isActor
          ? 'ServiceClass'
          : throw UnimplementedError();

  @override
  bool get serializable => false;
}

class Import extends IDLType<ImpContext> {
  Import(super.ctx, this.child);

  final ImportPart child;
  String? _did;

  @override
  String get did {
    _did ??= 'import "${child.did}";';
    return _did!;
  }

  @override
  // TODO: implement dartType
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  // TODO: implement idlType
  String get idlType => throw UnimplementedError();

  @override
  // TODO: implement type
  String get type => throw UnimplementedError();

  @override
  bool get serializable => false;
}

class Prog extends IDLType<ProgContext> {
  Prog(super.ctx, this.imports, this.defs, this.actor);

  final Iterable<Import> imports;
  final Iterable<Def> defs;
  final Actor? actor;

  String? _did;

  @override
  String get did {
    _did ??= [
      if (imports.isNotEmpty) imports.map((e) => e.did).join('\n'),
      if (defs.isNotEmpty) defs.map((e) => e.did).join('\n'),
      if (actor != null) actor!.did,
    ].whereType<String>().join('\n\n');
    return _did!;
  }

  @override
  // TODO: implement dartType
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  // TODO: implement idlType
  String get idlType => throw UnimplementedError();

  @override
  // TODO: implement type
  String get type => throw UnimplementedError();

  @override
  bool get serializable => false;
}

class FuncAnn extends IDLType<FuncAnnContext> {
  FuncAnn(super.ctx);

  @override
  // TODO: implement dartType
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  // TODO: implement idlType
  String get idlType => throw UnimplementedError();

  @override
  // TODO: implement type
  String get type => throw UnimplementedError();

  @override
  bool get serializable => true;
}

class ImportPart extends IDLType<ImportPartContext> {
  ImportPart(super.ctx);

  @override
  // TODO: implement dartType
  String dartType({bool nullable = false}) => throw UnimplementedError();

  @override
  // TODO: implement idlType
  String get idlType => throw UnimplementedError();

  @override
  // TODO: implement type
  String get type => throw UnimplementedError();

  @override
  bool get serializable => false;
}
