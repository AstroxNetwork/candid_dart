import 'dart:async';

import 'package:build/build.dart';
import 'package:candid_dart/codegen/codegen.dart';
import 'package:recase/recase.dart';

Builder candid2DartBuilder(BuilderOptions options) => Candid2DartBuilder();

class Candid2DartBuilder implements Builder {
  const Candid2DartBuilder();

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final outputId = inputId.changeExtension('.idl.dart');
    print('[START]: ${inputId.path} => ${outputId.path}');
    final contents = await buildStep.readAsString(inputId);
    final split = inputId.pathSegments.last.split('.');
    split.removeLast();
    final clazz = split.join('_').pascalCase;
    final code = codegen(clazz, contents);
    await buildStep.writeAsString(outputId, code);
    print('[  END]: ${inputId.path} => ${outputId.path}');
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      '.did': ['.idl.dart'],
    };
  }
}
