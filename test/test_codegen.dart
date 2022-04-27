import 'dart:io';

import 'package:candid_dart/codegen/codegen.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () async {
      var input = File('example/lib/did/test.did').readAsStringSync();
      var code = codegen("TestIDL", input);
      File('example/lib/did/test.idl.dart').writeAsStringSync(code);
    });
  });
}
