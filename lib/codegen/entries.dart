import 'dart:convert';

import 'package:antlr4/antlr4.dart';
import 'package:candid_dart/antlr/CandidParser.dart';

import 'serialize.dart';

class TypeNode {
  final RuleContext ctx;

  final TypeNode? parent;

  final bool optional;

  List<TypeNode>? _children;

  List<TypeNode> get children => _children ?? [];

  TypeNode(
    this.ctx, {
    this.parent,
    this.optional = false,
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
      ], optional);
    } else if (_ctx is VariantTypeContext) {
      _setChildren(_ctx.exprTypes(), true);
    } else if (_ctx is RecordTypeContext) {
      _setChildren(_ctx.exprTypes(), false);
    } else if (_ctx is PairTypeContext) {
      _setChildren([_ctx.idType(), _ctx.dataType()], optional);
    } else if (_ctx is IdTypeContext) {
      _setChildren([_ctx.id(), _ctx.primType()], optional);
    } else if (_ctx is VecTypeContext) {
      _setChild(_ctx.dataType(), false);
    } else if (_ctx is OptTypeContext) {
      _setChild(_ctx.dataType(), true);
    } else if (_ctx is TupleTypeContext) {
      _setChildren(_ctx.dataTypes(), optional);
    } else if (_ctx is ExprTypeContext) {
      _setChildren([
        _ctx.pairType(),
        _ctx.idType(),
        _ctx.vecType(),
        _ctx.optType(),
        _ctx.variantType(),
        _ctx.recordType(),
        _ctx.refType(),
      ], optional);
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
          optional: opt,
        );
      },
    ).toList(growable: false);
  }

  void _setChild(RuleContext? child, [bool opt = false]) {
    assert(_children == null);
    if (child != null) {
      _children = [TypeNode(child, parent: this, optional: opt)];
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
      "optional": optional,
      "children": children,
    };
  }
}

class IDLField implements Ser {
  @override
  final String did;
  @override
  final String idl;
  @override
  final String type;
  @override
  final bool opt;
  @override
  final String? ser;
  @override
  final String? deser;

  IDLField({
    required this.did,
    required this.idl,
    required this.type,
    required this.opt,
    this.ser,
    this.deser,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "did": did,
      "idl": idl,
      "type": type,
      "opt": opt,
      if (ser != null) "ser": ser,
      if (deser != null) "deser": deser,
    };
  }
}

class ClassField extends Comparable<ClassField> implements Ser {
  @override
  final String did;
  @override
  final String type;
  @override
  final String idl;
  @override
  final bool opt;
  @override
  final String? ser;
  @override
  final String? deser;

  final String id;
  final bool obj;

  ClassField({
    required this.id,
    required this.did,
    required this.type,
    required this.idl,
    required this.opt,
    this.obj = false,
    this.ser,
    this.deser,
  });

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "did": did,
      "type": type,
      "idl": idl,
      "obj": obj,
      "opt": opt,
      if (ser != null) "ser": ser,
      if (deser != null) "deser": deser,
    };
  }

  @override
  int compareTo(ClassField other) {
    return !opt && !other.opt
        ? 0
        : opt
            ? 1
            : -1;
  }
}
