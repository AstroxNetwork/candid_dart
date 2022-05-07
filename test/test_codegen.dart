import 'dart:io';

import 'package:candid_dart/codegen/codegen.dart';
import 'package:recase/recase.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      Directory("example/lib").listSync(recursive: true).forEach((e) {
        if (e.path.endsWith(".did")) {
          var target = e.path.replaceAll(RegExp(r".did$"), ".idl.dart");
          print('start: ${e.path} => $target');
          var input = (e as File).readAsStringSync();
          var split = e.path.split(Platform.pathSeparator).last.split(".");
          split.removeLast();
          var clazz = split.join("_").pascalCase;
          var code = codegen(clazz, input);
          File(target).writeAsStringSync(code);
          print('  end: ${e.path} => $target');
        }
      });
    });
  });
}
