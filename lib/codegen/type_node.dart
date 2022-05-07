import 'dart:convert';

import 'package:antlr4/antlr4.dart';
import 'package:candid_dart/antlr/CandidParser.dart';

class TypeNode {
  final RuleContext ctx;

  final TypeNode? parent;

  final bool nullable;

  List<TypeNode>? _children;

  List<TypeNode> get children => _children ?? [];

  TypeNode(
    this.ctx, {
    this.parent,
    this.nullable = false,
  }) {
    var _ctx = ctx;
    if (_ctx is DataTypeContext) {
      _setChildren([
        _ctx.idType(),
        _ctx.vecType(),
        _ctx.optType(),
        _ctx.variantType(),
        _ctx.recordType(),
        _ctx.refType(),
      ], nullable);
    } else if (_ctx is VariantTypeContext) {
      _setChildren(_ctx.exprTypes(), true);
    } else if (_ctx is RecordTypeContext) {
      _setChildren(_ctx.exprTypes(), false);
    } else if (_ctx is PairTypeContext) {
      _setChildren([_ctx.idType(), _ctx.dataType()], nullable);
    } else if (_ctx is IdTypeContext) {
      _setChildren([_ctx.id(), _ctx.primType()], nullable);
    } else if (_ctx is VecTypeContext) {
      _setChild(_ctx.dataType(), false);
    } else if (_ctx is OptTypeContext) {
      _setChild(_ctx.dataType(), true);
    } else if (_ctx is TupleTypeContext) {
      _setChildren(_ctx.exprTypes(), nullable);
    } else if (_ctx is ExprTypeContext) {
      _setChildren([
        _ctx.pairType(),
        _ctx.idType(),
        _ctx.vecType(),
        _ctx.optType(),
        _ctx.variantType(),
        _ctx.recordType(),
        _ctx.refType(),
      ], nullable);
    } else if (_ctx is RefTypeContext) {
      // todo refType
    }
  }

  void _setChildren(List<RuleContext?> children, [bool opt = false]) {
    assert(_children == null);
    _children = children.whereType<RuleContext>().map<TypeNode>(
      (e) {
        return TypeNode(
          e,
          parent: this,
          nullable: opt,
        );
      },
    ).toList(growable: false);
  }

  void _setChild(RuleContext? child, [bool opt = false]) {
    assert(_children == null);
    if (child != null) {
      _children = [TypeNode(child, parent: this, nullable: opt)];
    }
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      "ctx": ctx.runtimeType.toString(),
      "text": ctx.text,
      "optional": nullable,
      "children": children,
    };
  }
}
