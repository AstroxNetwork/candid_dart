import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:recase/recase.dart';

import '../consts.dart';
import '../type_node.dart';

class TypeDefParser extends CandidBaseListener {
  final Set<String> typeDefs = {};
  final Map<String, String> primIdlMap = {};
  final Set<String> _prims = {};
  final Map<String, List<String>> _mapTypes = {};

  @override
  void enterDef(DefContext ctx) {
    final type = ctx.idType()!.text;
    typeDefs.add(type);
    final node = TypeNode(ctx.dataType()!);
    final first = node.children.first;
    if (first.ctx is IdTypeContext) {
      _mapTypes.putIfAbsent(first.ctx.text, () => []).add(type);
      final idTypeNode = first.children.first;
      if (idTypeNode.ctx is PrimTypeContext) {
        final id = idTypeNode.ctx.text;
        _prims.add(id);
        primIdlMap[type] = kPrimitiveTypeIDLMap[id]!;
      }
      return;
    }
    _eachNode(node, type, typeDefs);
  }

  @override
  void exitProg(ProgContext ctx) {
    for (final prim in _prims) {
      final idl = kPrimitiveTypeIDLMap[prim]!;
      _ifContainsKey(prim, idl);
    }
  }

  void _ifContainsKey(String key, String idl) {
    if (_mapTypes.containsKey(key)) {
      final types = _mapTypes[key]!;
      primIdlMap.addEntries(types.map((e) => MapEntry(e, idl)));
      for (final t in types) {
        _ifContainsKey(t, idl);
      }
    }
  }

  void _eachNode(TypeNode node, String type, Set<String> defs) {
    final children = node.children;
    final ctx = node.ctx;
    if (ctx is PairTypeContext) {
      _check(type, defs, ctx);
      type = type + ctx.idType()!.text.pascalCase;
    }
    for (final child in children) {
      _eachNode(child, type, defs);
    }
  }

  void _check(String parent, Set<String> defs, PairTypeContext ctx) {
    final dataType = ctx.dataType()!;
    final idType = ctx.idType()!;
    final type = parent + idType.text.pascalCase;
    _addDef(type, defs, dataType);
    _checkVecType(type, defs, dataType);
    _checkOptType(type, defs, dataType);
  }

  void _checkOptType(
    String name,
    Set<String> defs,
    DataTypeContext dataType,
  ) {
    final optType = dataType.optType();
    if (optType != null) {
      final dataType = optType.dataType()!;
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
