import 'dart:async';

import 'package:build/build.dart';
import 'package:candid_dart/codegen/codegen.dart';
import 'package:recase/recase.dart';

Builder candid2DartBuilder(BuilderOptions options) => Candid2DartBuilder();

class Candid2DartBuilder implements Builder {
  const Candid2DartBuilder();

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.idl.dart');
    print('start: ${inputId.path} => ${outputId.path}');
    var contents = await buildStep.readAsString(inputId);
    var split = inputId.pathSegments.last.split(".");
    split.removeLast();
    var clazz = split.join("_").pascalCase;
    var code = codegen(clazz, contents);
    await buildStep.writeAsString(outputId, code);
    print('  end: ${inputId.path} => ${outputId.path}');
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      ".did": ['.idl.dart'],
    };
  }
}
