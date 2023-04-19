import 'package:antlr4/antlr4.dart';
import 'package:recase/recase.dart';

import '../antlr/CandidParser.dart';
import 'consts.dart';

extension NullableStringExt on String? {
  bool get isNullOrBlank => this == null || this!.isBlank;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotBlank => this != null && !this!.isBlank;
}

extension StringExt on String {
  bool get isBlank {
    if (length == 0) {
      return true;
    }
    for (final value in runes) {
      if (!_isWhitespace(value)) {
        return false;
      }
    }
    return true;
  }

  bool _isWhitespace(int rune) =>
      (rune >= 0x0009 && rune <= 0x000D) ||
      rune == 0x0020 ||
      rune == 0x0085 ||
      rune == 0x00A0 ||
      rune == 0x1680 ||
      rune == 0x180E ||
      (rune >= 0x2000 && rune <= 0x200A) ||
      rune == 0x2028 ||
      rune == 0x2029 ||
      rune == 0x202F ||
      rune == 0x205F ||
      rune == 0x3000 ||
      rune == 0xFEFF;

  String toPascalCase() {
    final key = replaceFirst('?', '');
    if (kDartKeywordsAndInternalTypes.contains(key)) {
      return this;
    }
    return pascalCase;
  }
}

extension ForTypeString on String {
  String nullable(bool optional) {
    if (optional) {
      return '$this?';
    }
    return this;
  }
}

extension RuleContextExtension on RuleContext {
  static final _paths = <RuleContext, String>{};

  String getPath() {
    if (_paths.containsKey(this)) {
      return _paths[this]!;
    }
    RuleContext? ctx = this;
    final path = <RuleContext>[];
    while (ctx != null) {
      path.add(ctx);
      ctx = ctx.parent;
    }
    final ids = <String>[];
    RuleContext? prev;
    for (final p in path.reversed) {
      if (p is PairTypeContext) {
        ids.add(p.idType()!.text);
      } else if (p is TupleTypeContext) {
        if (prev is FuncTypeContext) {
          final indexOf = prev.tupleTypes().indexOf(p);
          if (indexOf == 0) {
            ids.add('Arg');
          } else if (indexOf == 1) {
            ids.add('Ret');
          }
        }
      } else if (p is MethTypeContext) {
        ids.add(p.idType(0)!.text);
      } else if (p is DefContext) {
        ids.add(p.idType()!.text);
      } else if (p is ActorContext) {
        final length = p.idTypes().length;
        if (length == 2 || (length == 1 && p.actorType() != null)) {
          ids.add(p.idType(0)!.text);
        }
      } else if (p is OptTypeContext) {
        ids.add('Opt');
      } else if (p is VecTypeContext) {
        ids.add('Item');
      }
      if (prev is RecordTypeContext && prev.exprTypes().isNotEmpty) {
        final isTuple = prev
            .exprTypes()
            .every((e) => e.children!.first is! PairTypeContext);
        if (isTuple) {
          final list =
              prev.exprTypes().map((e) => e.text).toList(growable: false);
          if (list.any((e) => e != p.text)) {
            final index = list.indexOf(p.text);
            ids.add(index.toString());
          }
        }
      }
      if (prev is TupleTypeContext && p is ExprTypeContext) {
        final indexOf = prev.exprTypes().indexOf(p);
        ids.add(indexOf.toString());
      }
      prev = p;
    }
    if (ids.isNotEmpty) {
      final path = ids.join('_');
      _paths[this] = path;
      return path;
    }
    throw StateError('Class name not found');
  }

  String getClassName() {
    return getPath().pascalCase;
  }
}
