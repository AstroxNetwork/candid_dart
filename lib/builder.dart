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
    var contents = await buildStep.readAsString(inputId);
    var split = inputId.pathSegments.last.split(".");
    split.removeLast();
    var clazz = split.join("_").pascalCase;
    var code = codegen(clazz, contents);
    var outputId = inputId.changeExtension('.idl.dart');
    await buildStep.writeAsString(outputId, code);
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      ".did": ['.idl.dart'],
    };
  }
}
