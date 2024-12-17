import 'dart:convert';

import 'package:antlr4/antlr4.dart';
import 'package:collection/collection.dart';

import '../antlr/CandidBaseVisitor.dart';
import '../antlr/CandidParser.dart';
import 'consts.dart';
import 'extension.dart';
import 'types.dart';

const pkgCollection = 'package:collection/collection.dart';
const pkgTypeData = 'dart:typed_data';

typedef SerFactory = Def Function();

class IDLVisitor extends CandidBaseVisitor<IDLType<RuleContext>> {
  final sers = <String, SerFactory>{};
  final objs = <String, ObjectType>{};
  final enums = <String, ObjectType>{};
  final tuples = <String, TupleType>{};
  final typedefs = <String, Def>{};
  final pkgs = <String>{};
  final methods = <MethodKey, MethType>{};
  final sameObjs = <String, Set<String>>{};

  @override
  IDLType<RuleContext> visitActor(ActorContext ctx) {
    final init =
        ctx.tupleType() == null ? null : visit(ctx.tupleType()!) as TupleType;
    RuleContext? body = ctx.actorType();
    RuleContext? id;
    if (body == null) {
      body = ctx.idTypes().last;
      if (ctx.idTypes().length == 2) {
        id = ctx.idType(0);
      }
    } else {
      if (ctx.idTypes().isNotEmpty) {
        id = ctx.idType(0);
      }
    }
    return Actor(
      ctx,
      id == null ? null : visit(id) as IdType,
      init,
      visit(body)!,
    );
  }

  @override
  IDLType<RuleContext> visitActorType(ActorTypeContext ctx) {
    final children = ctx
        .methTypes()
        .map((e) => visit(e) as MethType)
        .toList(growable: false);
    final actorType = ActorType(ctx, children);
    return actorType;
  }

  @override
  IDLType<RuleContext> visitDataType(DataTypeContext ctx) {
    final child = visit(ctx.children!.first)!;
    return DataType(ctx, child);
  }

  @override
  IDLType<RuleContext> visitProg(ProgContext ctx) {
    final imports = ctx.imps().map((e) => visit(e) as Import);
    final defs = ctx.defs().map((e) => visit(e) as Def);
    final actor = ctx.actor() == null ? null : visit(ctx.actor()!) as Actor;
    return Prog(ctx, imports, defs, actor);
  }

  @override
  IDLType<RuleContext> visitExprType(ExprTypeContext ctx) {
    final child = visit(ctx.children!.first)!;
    return ExprType(ctx, child);
  }

  @override
  IDLType<RuleContext> visitFuncAnn(FuncAnnContext ctx) {
    return FuncAnn(ctx);
  }

  @override
  IDLType<RuleContext> visitFuncType(FuncTypeContext ctx) {
    final args = visit(ctx.tupleType(0)!) as TupleType;
    final ret = visit(ctx.tupleType(1)!) as TupleType;
    final anno =
        ctx.funcAnn() == null ? null : visit(ctx.funcAnn()!) as FuncAnn;
    final funcType = FuncType(ctx, args, ret, anno);
    return funcType;
  }

  @override
  IDLType<RuleContext> visitIdType(IdTypeContext ctx) {
    return IdType(ctx, visit((ctx.id() ?? ctx.primType())!)!);
  }

  @override
  IDLType<RuleContext> visitImp(ImpContext ctx) {
    return Import(ctx, visit(ctx.importPart()!) as ImportPart);
  }

  @override
  IDLType<RuleContext> visitImportPart(ImportPartContext ctx) {
    return ImportPart(ctx);
  }

  @override
  IDLType<RuleContext> visitMethType(MethTypeContext ctx) {
    final id = visit(ctx.children!.first) as IdType;
    final body = visit(ctx.children!.last)!;
    final methType = MethType(ctx, id, body);
    var parent = ctx.parent;
    String? actor;
    while (parent != null) {
      final p = parent;
      if (p is ActorTypeContext) {
        final pp = p.parent;
        if (pp is RefTypeContext) {
          break;
        } else if (pp is ActorContext) {
          final idTypes = pp.idTypes();
          if (idTypes.isNotEmpty) {
            actor = idTypes.first.text;
          }
          break;
        }
      }
      parent = p.parent;
    }
    methods[MethodKey(id.did, actor)] = methType;
    return methType;
  }

  @override
  IDLType<RuleContext> visitOptType(OptTypeContext ctx) {
    final child = visit(ctx.dataType()!) as DataType;
    if (!pkgs.contains(pkgCollection)) {
      pkgs.add(pkgCollection);
    }
    return OptType(ctx, child);
  }

  @override
  IDLType<RuleContext> visitPairType(PairTypeContext ctx) {
    final key = visit(ctx.idType()!) as IdType;
    final value = visit(ctx.dataType()!) as DataType;
    return PairType(ctx, key, value);
  }

  @override
  IDLType<RuleContext> visitPrimType(PrimTypeContext ctx) {
    if (ctx.blobType() != null) {
      pkgs.add(pkgTypeData);
    }
    return PrimType(ctx);
  }

  @override
  IDLType<RuleContext> visitId(IdContext ctx) {
    return Id(ctx, sers);
  }

  @override
  IDLType<RuleContext> visitRefType(RefTypeContext ctx) {
    return RefType(ctx, visit((ctx.actorType() ?? ctx.funcType())!)!);
  }

  @override
  IDLType<RuleContext> visitTupleType(TupleTypeContext ctx) {
    final exprs = ctx
        .exprTypes()
        .map((e) => visit(e) as ExprType)
        .toList(growable: false);
    final tupleType = TupleType(ctx, exprs);
    final parent = ctx.parent;
    if (parent is FuncTypeContext &&
        exprs.length > 1 &&
        tupleType.serializable) {
      tuples[tupleType.ctx.getClassName()] = tupleType;
    }
    return tupleType;
  }

  @override
  IDLType<RuleContext> visitVecType(VecTypeContext ctx) {
    final vecType = VecType(ctx, visit(ctx.dataType()!) as DataType);
    if (vecType.isUint8List) {
      if (!pkgs.contains(pkgTypeData)) {
        pkgs.add(pkgTypeData);
      }
    } else {
      if (!pkgs.contains(pkgCollection)) {
        pkgs.add(pkgCollection);
      }
    }
    return vecType;
  }

  @override
  IDLType<RuleContext> visitDef(DefContext ctx) {
    final id = visit(ctx.idType()!) as IdType;
    final dataTypeContext = ctx.dataType()!;
    final body = visit(dataTypeContext) as DataType;
    final did = id.did;
    final def = Def(ctx, id, body);
    if (dataTypeContext.recordType() == null &&
        dataTypeContext.variantType() == null) {
      typedefs[def.did] = def;
    }
    sers[did] = () => def;
    return def;
  }

  @override
  IDLType<RuleContext> visitRecordType(RecordTypeContext ctx) {
    final exprs = ctx
        .exprTypes()
        .map((e) => visit(e) as ExprType)
        .toList(growable: false);
    final recordType = RecordType(ctx, exprs);
    _addObj(recordType);
    return recordType;
  }

  @override
  IDLType<RuleContext> visitVariantType(VariantTypeContext ctx) {
    final exprs = ctx
        .exprTypes()
        .map((e) => visit(e) as ExprType)
        .toList(growable: false);
    final variantType = VariantType(ctx, exprs);
    _addObj(variantType);
    return variantType;
  }

  void _addObj(ObjectType type) {
    if (!type.serializable) {
      return;
    }
    final className = type.ctx.getClassName();
    final sames = sameObjs.putIfAbsent(type.did, () => {})..add(className);
    if (sames.length > 1) {
      return;
    }
    if (type.isEnum) {
      enums[className] = type;
    } else {
      objs[className] = type;
    }
  }
}

class PreVisitor extends CandidBaseVisitor<void> {
  final Map<String, Set<String>> _deps = {};
  Set<String>? _dep;

  Map<String, Dep> get deps {
    final ds = <String, List<Set<String>>>{};
    _deps.forEach((key, vals) {
      final list = ds.putIfAbsent(key, () => [vals]);
      for (final dep in vals) {
        if (_deps.containsKey(dep)) {
          list.add(_deps[dep]!);
        }
      }
      list.forEach(vals.addAll);
    });
    final ret = <String, Dep>{};
    ds.forEach((key, value) {
      ret[key] = Dep(id: key, deps: value.reduce((v, e) => v..addAll(e)));
    });
    return ret;
  }

  @override
  void visitDef(DefContext ctx) {
    _dep = {};
    final visitDef = super.visitDef(ctx);
    _deps[ctx.idType()!.text] = _dep!;
    _dep = null;
    return visitDef;
  }

  @override
  void visitVecType(VecTypeContext ctx) {
    _addDep(ctx.dataType()?.idType()?.id());
    return super.visitVecType(ctx);
  }

  @override
  void visitRecordType(RecordTypeContext ctx) {
    for (final exprType in ctx.exprTypes()) {
      _addDep(exprType.idType()?.id());
      _addDep(exprType.pairType()?.dataType()?.idType()?.id());
    }
    return super.visitRecordType(ctx);
  }

  @override
  void visitOptType(OptTypeContext ctx) {
    _addDep(ctx.dataType()?.idType()?.id());
    return super.visitOptType(ctx);
  }

  @override
  void visitVariantType(VariantTypeContext ctx) {
    for (final exprType in ctx.exprTypes()) {
      _addDep(exprType.pairType()?.dataType()?.idType()?.id());
    }
    return super.visitVariantType(ctx);
  }

  void _addDep(IdContext? id) {
    if (id != null && _dep != null) {
      final text = id.text;
      if (!kPrimitiveTypeIDLMap.containsKey(text)) {
        _dep!.add(text);
      }
    }
  }
}

class Dep {
  Dep({
    required this.id,
    required this.deps,
  });

  final String id;
  final Set<String> deps;

  late final bool cd = deps.contains(id);
  late final List<String> _deps = deps.toList(growable: false);

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Dep &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          const SetEquality().equals(deps, other.deps);

  @override
  int get hashCode => id.hashCode ^ deps.hashCode;

  Map<String, dynamic> toJson() => {'id': id, 'deps': _deps, 'cd': cd};
}

typedef SerFunction = String? Function();

class MethodKey {
  MethodKey(this.id, this.actor);

  final String id;
  final String? actor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodKey &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          actor == other.actor;

  @override
  int get hashCode => id.hashCode ^ actor.hashCode;
}
