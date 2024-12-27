import 'dart:convert';
import 'dart:io';

import 'package:candid_dart_core/codegen/visitor.dart';
import 'package:candid_dart_core/core.dart';
import 'package:test/test.dart';

void main() {
  group('Test visitors', () {
    test('test CircularDependencyVisitor', () {
      final contents = File('example/lib/did/cd.did').readAsStringSync();
      final parser = newParser(contents);
      final visitor = PreVisitor();
      visitor.visit(parser.prog());
      final deps = visitor.deps;
      expect(
        deps['Node2'],
        Dep(id: 'Node2', deps: const {'Node', 'Node1', 'Node2'}),
      );
      expect(
        deps['Node1'],
        Dep(id: 'Node1', deps: const {'Node', 'Node1', 'Node2'}),
      );
      expect(
        deps['Node'],
        Dep(id: 'Node', deps: const {'Node', 'Node1', 'Node2'}),
      );
      expect(deps['A'], Dep(id: 'A', deps: const {'B', 'C', 'D'}));
      expect(deps['B'], Dep(id: 'B', deps: const {'B', 'C'}));
      expect(deps['C'], Dep(id: 'C', deps: const {'B', 'C'}));
      expect(
        deps['D'],
        Dep(
          id: 'D',
          deps: const {'B', 'C', 'D', 'E', 'Node', 'Node1', 'Node2'},
        ),
      );
      expect(deps['E'], Dep(id: 'E', deps: const {}));
      expect(deps['F'], Dep(id: 'F', deps: const {'E'}));
      File('example/lib/did/cd.did.json').writeAsStringSync(jsonEncode(deps));
    });

    test('test IDL', () {
      final list =
          Directory('../../example/lib/did').listSync(recursive: true).toList();
      for (final f in list.toList()) {
        final filePath = f.path;
        if (filePath.endsWith('.idl.dart')) {
          f.deleteSync();
          list.remove(f);
        }
      }

      for (final f in list) {
        final filePath = f.path;
        if (filePath.endsWith('.did')) {
          final contents = (f as File).readAsStringSync();
          final fileName = filePath.split(Platform.pathSeparator).last;
          final code = did2dart(
            fileName,
            contents,
            const GenOption(service: true),
          );
          File(
            filePath.replaceAll(RegExp(r'.did$'), '.idl.dart'),
          ).writeAsStringSync(code);
        }
      }
    });
  });
}
