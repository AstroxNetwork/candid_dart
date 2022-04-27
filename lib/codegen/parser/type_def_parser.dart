import 'package:candid_dart/antlr/CandidBaseListener.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:recase/recase.dart';

import '../consts.dart';
import '../entries.dart';

class TypeDefParser extends CandidBaseListener {
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
