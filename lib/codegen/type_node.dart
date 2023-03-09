import 'dart:convert';

import 'package:antlr4/antlr4.dart';
import 'package:candid_dart/antlr/CandidParser.dart';

class TypeNode {
  TypeNode(
    this.ctx, {
    this.parent,
    this.nullable = false,
  }) {
    final context = ctx;
    if (context is DataTypeContext) {
      _setChildren([
        context.idType(),
        context.vecType(),
        context.optType(),
        context.variantType(),
        context.recordType(),
        context.refType(),
      ], nullable);
    } else if (context is VariantTypeContext) {
      _setChildren(context.exprTypes(), true);
    } else if (context is RecordTypeContext) {
      _setChildren(context.exprTypes(), false);
    } else if (context is PairTypeContext) {
      _setChildren([context.idType(), context.dataType()], nullable);
    } else if (context is IdTypeContext) {
      _setChildren([context.id(), context.primType()], nullable);
    } else if (context is VecTypeContext) {
      _setChild(context.dataType(), false);
    } else if (context is OptTypeContext) {
      _setChild(context.dataType(), true);
    } else if (context is TupleTypeContext) {
      _setChildren(context.exprTypes(), nullable);
    } else if (context is ExprTypeContext) {
      _setChildren([
        context.pairType(),
        context.idType(),
        context.vecType(),
        context.optType(),
        context.variantType(),
        context.recordType(),
        context.refType(),
      ], nullable);
    } else if (context is RefTypeContext) {
      // TODO: Handle RefTypeContext.
    }
  }

  final RuleContext ctx;

  final TypeNode? parent;

  final bool nullable;

  List<TypeNode>? _children;

  List<TypeNode> get children => _children ?? [];

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

  Map<String, dynamic> toJson() {
    return {
      'ctx': ctx.runtimeType.toString(),
      'text': ctx.text,
      'nullable': nullable,
      'children': children,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
