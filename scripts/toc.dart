import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:shell/shell.dart';

Future<void> main() async {
  final mds = <File>[];
  _listMDs(Directory('packages'), mds);
  final shell = Shell();
  for (final md in mds) {
    print('insert TOC: ${md.path}');
    await shell.run(
      // https://github.com/jonschlinkert/markdown-toc
      // pnpm add --global markdown-toc
      'markdown-toc',
      arguments: ['-i', path.normalize(md.absolute.path)],
    );
  }
}

void _listMDs(Directory directory, List<File> mds) {
  final list = directory.listSync();
  for (final e in list) {
    if (e is File &&
        RegExp(r'README.*.md$', caseSensitive: false).hasMatch(e.path)) {
      mds.add(e);
    } else if (e is Directory) {
      _listMDs(e, mds);
    }
  }
}
