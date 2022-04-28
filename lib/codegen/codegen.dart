import 'package:antlr4/antlr4.dart';
import 'package:candid_dart/antlr/CandidLexer.dart';
import 'package:candid_dart/antlr/CandidParser.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mustache_template/mustache.dart';
import 'package:recase/recase.dart';

import 'extension.dart';
import 'parser/class_def_parser.dart';
import 'parser/idl_parser.dart';
import 'parser/type_def_parser.dart';
import 'serialize.dart';
import 'templates.dart';

class ClassRender {
  static renderToJsonFields(Iterable<SerField> fields) {
    return (LambdaContext _) => fields.map((e) {
          var arg = e.ser == null
              ? e.id!.camelCase
              : e.ser!.replaceAll(SerField.ph, e.id!.camelCase);
          return "'${e.id}': $arg,";
        }).join("\n");
  }

  static renderRecordIDL(Iterable<SerField> fields) {
    return (LambdaContext _) => """
      static final RecordClass idl = IDL.Record(<String, dynamic>{
        ${fields.map((e) => "'${e.id}': ${e.idl},").join("\n")}
      },);
    """;
  }

  static renderVariantIDL(String type, Iterable<SerField> fields) {
    // var defaultType = fields.isNotEmpty
    //     ? 'static const $type defaultType = $type(${fields.first.id.camelCase}: true);'
    //     : '';
    return (LambdaContext _) => """
    static final VariantClass idl = IDL.Variant(<String, CType<dynamic>>{
      ${fields.map((e) => "'${e.id}': ${e.idl},").join("\n")}
    },);
    """;
  }

  static renderFromMapFields(bool isVariant, Iterable<SerField> fields) {
    if (isVariant) {
      return (LambdaContext _) {
        return fields.map((e) {
          String deser;
          if (e.deser != null) {
            deser = e.deser!.replaceAll(SerField.ph, "map['${e.id}']");
          } else {
            deser = e.type == 'bool'
                ? "map.containsKey('${e.id}')"
                : "map['${e.id}']";
          }
          return "${e.id!.camelCase}: $deser,";
        }).join("\n");
      };
    }
    return (LambdaContext _) => fields.map((e) {
          String deser;
          if (e.deser != null) {
            deser = e.deser!.replaceAll(SerField.ph, "map['${e.id}']");
          } else {
            deser = "map['${e.id}']";
          }
          return "${e.id!.camelCase}: $deser,";
        }).join("\n");
  }

  static renderConstructorFields(Iterable<SerField> fields) {
    return (LambdaContext _) => fields
        .map((e) => "${e.nullable ? '' : 'required'} this.${e.id!.camelCase},")
        .join("\n");
  }

  static renderFields(Iterable<SerField> fields) {
    return (LambdaContext _) => fields
        .map((e) =>
            "/// did: ${e.did} \nfinal ${e.type.nullable(e.nullable)} ${e.id!.camelCase};")
        .join("\n");
  }
}

T ifSupport<T>(RuleContext ctx, Supplier<T?> support) {
  var t = support();
  if (t == null) {
    throw UnsupportedTypeContextException(ctx);
  }
  return t;
}

typedef Supplier<T> = T Function();

typedef Transform<T, R> = R Function(T e);

class UnsupportedTypeContextException implements Exception {
  final RuleContext ctx;

  const UnsupportedTypeContextException(this.ctx);

  @override
  String toString() {
    return "Unsupported type rule context `<${ctx.runtimeType}=${ctx.text}>`.";
  }
}

String codegen(String clazz, String contents) {
  CandidLexer.checkVersion();
  CandidParser.checkVersion();
  var input = InputStream.fromString(contents);
  var lexer = CandidLexer(input);
  var tokens = CommonTokenStream(lexer);
  var parser = CandidParser(tokens);
  parser.addErrorListener(DiagnosticErrorListener());
  parser.buildParseTree = true;
  var did = parser.did();
  var typeDef = TypeDefParser();
  ParseTreeWalker.DEFAULT.walk(typeDef, did);
  var classDef = ClassDefParser(typeDef.typeDefs, typeDef.primIdlMap);
  ParseTreeWalker.DEFAULT.walk(classDef, did);
  var idl = IDLParser(clazz, typeDef.typeDefs, typeDef.primIdlMap);
  ParseTreeWalker.DEFAULT.walk(idl, did);
  var formatter = DartFormatter();
  var code = Template(
    fileTpl,
    htmlEscapeValues: false,
  ).renderString({
    "idl": idl.idlCodes,
    "classes": classDef.classCodes,
  });
  code = formatter.format(code);
  return code;
}
