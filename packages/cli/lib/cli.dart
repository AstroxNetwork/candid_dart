import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:candid_dart_core/core.dart';

Future<void> cli(List<String> arguments) async {
  final watch = Stopwatch()..start();
  final parser = ArgParser();
  parser.addOption(
    'path',
    abbr: 'p',
    help: 'Specify the path of the `.did` file.',
  );
  parser.addOption(
    'dir',
    abbr: 'd',
    help: 'Specify the directory where the `.did` files are located.',
  );
  parser.addFlag(
    'recursive',
    abbr: 'r',
    negatable: false,
    help:
        'Determine whether to search for `.did` files recursively. This option only works when specifying a directory.',
  );
  parser.addFlag(
    'freezed',
    abbr: 'f',
    negatable: false,
    help: 'Determine whether to use `Freezed`.',
  );
  parser.addFlag(
    'equal',
    abbr: 'e',
    defaultsTo: true,
    negatable: false,
    help: 'Determine whether to generate `equals` and `hashCode` methods.',
  );
  parser.addFlag(
    'copyWith',
    abbr: 'c',
    defaultsTo: true,
    negatable: false,
    help: 'Determine whether to generate `copyWith` method.',
  );
  parser.addFlag(
    'makeCollectionsUnmodifiable',
    abbr: 'u',
    defaultsTo: true,
    negatable: false,
    help:
        'Determine whether collection fields are unmodifiable. This option only works when `Freezed` is enabled.',
  );
  parser.addFlag(
    'help',
    abbr: 'h',
    negatable: false,
    help: 'View help options.',
  );
  final parse = parser.parse(arguments);
  if (parse['help'] == true) {
    // ignore: avoid_print
    print(parser.usage);
    return;
  }
  final path = parse['path'];
  final dir = parse['dir'];
  if (path == null && dir == null) {
    'Please specify at least one argument: `-path` or `-dir`.'.$warn(tag: '🚨');
    return;
  }
  final option = GenOption(
    freezed: parse['freezed'],
    makeCollectionsUnmodifiable: parse['makeCollectionsUnmodifiable'],
    equal: parse['equal'],
    copyWith: parse['copyWith'],
  );
  option.$info(tag: '   options');
  if (path != null) {
    _writeCode(File(path), option);
  }
  if (dir != null) {
    Directory(dir).listSync(recursive: parse['recursive']).forEach((f) {
      if (f is File) {
        _writeCode(f, option);
      }
    });
  }
  'took ${watch.elapsed}.'.$info(tag: ' completed');
}

void _writeCode(File f, GenOption option) {
  final filePath = f.path;
  if (filePath.endsWith('.did')) {
    filePath.$debug(tag: '.did found');
    final contents = f.readAsStringSync();
    final fileName = filePath.split(Platform.pathSeparator).last;
    final code = did2dart(fileName, contents, option);
    final newPath = filePath.replaceAll(RegExp(r'.did$'), '.idl.dart');
    File(newPath).writeAsStringSync(code);
    newPath.$debug(tag: ' generated');
  }
}
