import 'dart:async';

import 'package:build/build.dart';
import 'package:candid_dart_core/core.dart';

Builder candid2dart(BuilderOptions options) =>
    Candid2DartBuilder(GenOption.fromJson(options.config));

class Candid2DartBuilder implements Builder {
  const Candid2DartBuilder(this.option);

  final GenOption option;

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final outputId = inputId.changeExtension('.idl.dart');
    final contents = await buildStep.readAsString(inputId);
    final fileName = inputId.pathSegments.last;
    final code = did2dart(fileName, contents, option);
    await buildStep.writeAsString(outputId, code);
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      '.did': ['.idl.dart'],
    };
  }
}
