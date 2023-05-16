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
    'inject-packages',
    abbr: 'i',
    help: 'Import packages with settings into each generated Dart file.',
  );
  parser.addOption(
    'pre-actor-call',
    abbr: 'b',
    help:
        'Inject a piece of code before calling the Actor method, which can reference the request parameters `request` and the parameter of type CanisterActor `actor`.',
  );
  parser.addOption(
    'post-actor-call',
    abbr: 'a',
    help:
        'Inject a piece of code after calling the Actor method, which can reference the request parameters `request`, the parameter of type CanisterActor `actor`, and the return result of the method `response`.',
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
    'service',
    abbr: 's',
    negatable: false,
    help: 'Is `Service` generated automatically?',
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
    'copy-with',
    abbr: 'c',
    defaultsTo: true,
    negatable: false,
    help: 'Determine whether to generate `copyWith` method.',
  );
  parser.addFlag(
    'make-collections-unmodifiable',
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
  List<String>? packages;
  final i = parse['inject-packages'];
  if (i != null) {
    packages =
        (i as String).split(',').map((e) => e.trim()).toList(growable: false);
  }

  final option = GenOption(
    freezed: parse['freezed'],
    makeCollectionsUnmodifiable: parse['make-collections-unmodifiable'],
    equal: parse['equal'],
    copyWith: parse['copy-with'],
    service: parse['service'],
    injectPackages: packages,
    preActorCall: parse['pre-actor-call'],
    postActorCall: parse['post-actor-call'],
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
