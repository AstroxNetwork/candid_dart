import 'package:antlr4/antlr4.dart';
import 'package:candid_dart/antlr/CandidLexer.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:candid_dart/codegen/templates.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';

import 'extension.dart';
import 'parser/class_def_parser.dart';
import 'parser/idl_parser.dart';
import 'parser/type_def_parser.dart';
import 'serialize.dart';

class ClassRender {
  const ClassRender._();

  static renderToJsonFields(Iterable<SerField> fields) {
    return (LambdaContext _) => fields.map((e) {
          final arg = e.ser == null
              ? e.id!.camelCase
              : e.ser!.replaceAll(SerField.ph, e.id!.camelCase);
          return "'${e.id}': $arg,";
        }).join('\n');
  }

  static renderRecordIDL(Iterable<SerField> fields) {
    return (LambdaContext _) => """
      static final RecordClass idl = IDL.Record(<String, dynamic>{
        ${fields.map((e) => "'${e.id}': ${e.idl},").join("\n")}
      },);
    """;
  }

  static renderClassComment(String clazz, String did) {
    return (LambdaContext _) => '/// [$clazz] defined in Candid\n/// $did';
  }

  static renderVariantIDL(String type, Iterable<SerField> fields) {
    return (LambdaContext _) => """
    static final VariantClass idl = IDL.Variant(<String, CType<dynamic>>{
      ${fields.map((e) => "'${e.id}': ${e.idl},").join("\n")}
    },);
    """;
  }

  static renderFromMapFields(Iterable<SerField> fields) {
    return (LambdaContext _) => fields.map((e) {
          String deser;
          if (e.deser != null) {
            deser = e.deser!.replaceAll(SerField.ph, "map['${e.id}']");
          } else {
            deser = e.idl == 'IDL.Null'
                ? "map.containsKey('${e.id}')"
                : "map['${e.id}']";
          }
          return '${e.id!.camelCase}: $deser,';
        }).join('\n');
  }

  static renderConstructorFields(Iterable<SerField> fields) {
    if (fields.isEmpty) return '';
    return (LambdaContext _) => "{${fields.map((e) {
          if (e.type == 'bool' && e.idl == 'IDL.Null') {
            return "this.${e.id!.camelCase} = false,";
          }
          return "${e.nullable ? '' : 'required'} this.${e.id!.camelCase},";
        }).join("\n")}}";
  }

  static renderFields(Iterable<SerField> fields) {
    return (LambdaContext _) => fields.map((e) {
          final id = e.id!.camelCase;
          return '/// [$id] : ${e.did} \nfinal ${e.type.nullable(e.nullable)} $id;';
        }).join('\n');
  }

  static renderToString() {
    return (LambdaContext _) =>
        // language=dart
        '''
      @override
      String toString() {
        return toJson().toString();
      }
    ''';
  }

  static renderEquals(String clazz, Iterable<SerField> fields) {
    if (fields.isEmpty) return '';
    return (LambdaContext _) => """
      @override
      bool operator ==(Object other) =>
          identical(this, other) ||
          other is $clazz &&
              runtimeType == other.runtimeType &&
              ${fields.map((e) {
          final id = e.id!.camelCase;
          return "this.$id == other.$id";
        }).join("&&")};
    """;
  }

  static renderHashCode(Iterable<SerField> fields) {
    if (fields.isEmpty) return '';
    return (LambdaContext _) => """
      @override
      int get hashCode =>
          ${fields.map((e) => "${e.id!.camelCase}.hashCode").join("^")};
    """;
  }

  static renderCopy(String clazz, List<SerField> fields) {
    if (fields.isEmpty) return '';
    final c = StringBuffer();
    final p = StringBuffer();
    final v = StringBuffer();
    for (final e in fields) {
      final id = e.id!.camelCase;
      c.writeln('/// * [$id] : ${e.did}');
      p.writeln('${e.type}? $id,');
      v.writeln('$id: $id ?? this.$id,');
    }
    return (LambdaContext _) => '''
      /// Types defined in Candid
      $c$clazz copyWith({
        $p
      }) {
        return $clazz($v);
      }
    ''';
  }
}

T ifSupport<T>(RuleContext ctx, Supplier<T?> support) {
  final t = support();
  if (t == null) {
    throw UnsupportedTypeContextException(ctx);
  }
  return t;
}

typedef Supplier<T> = T Function();

typedef Transform<T, R> = R Function(T e);

class UnsupportedTypeContextException implements Exception {
  const UnsupportedTypeContextException(this.ctx);

  final RuleContext ctx;

  @override
  String toString() {
    return 'Unsupported type rule context `<${ctx.runtimeType}=${ctx.text}>`.';
  }
}

String codegen(String clazz, String contents) {
  CandidLexer.checkVersion();
  CandidParser.checkVersion();
  final input = InputStream.fromString(contents);
  final lexer = CandidLexer(input);
  final tokens = CommonTokenStream(lexer);
  final parser = CandidParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());
  parser.buildParseTree = true;
  final prog = parser.prog();
  final typeDef = TypeDefParser();
  ParseTreeWalker.DEFAULT.walk(typeDef, prog);
  final classDef = ClassDefParser(typeDef.typeDefs, typeDef.primIdlMap);
  ParseTreeWalker.DEFAULT.walk(classDef, prog);
  final idl = IDLParser(
    clazz,
    typeDef.typeDefs,
    typeDef.primIdlMap,
    classDef.tupleTypes,
  );
  ParseTreeWalker.DEFAULT.walk(idl, prog);
  final formatter = DartFormatter();
  final code = formatter.format(Template(
    fileTpl,
    htmlEscapeValues: false,
  ).renderString({
    'idl': idl.idlCodes,
    'classes': classDef.classCodes,
  }));
  return code;
}
