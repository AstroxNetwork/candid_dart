import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';

Future<void> save(List<MapEntry<PlatformFile, List<String>>> entries) async {
  if (entries.isEmpty) {
    return;
  }
  if (entries.length == 1) {
    final entry = entries.first;
    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Please choose a location to save the file',
      fileName: entry.key.name.replaceAll(RegExp(r'.did$'), '.idl.dart'),
    );
    if (path == null) {
      return;
    }
    final encode = utf8.encode(entry.value.join('\n'));
    await File(path).writeAsBytes(encode);
  } else {
    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Please choose a location to save the file',
      fileName: 'dart_idls.zip',
    );
    if (path == null) {
      return;
    }
    final encoder = ZipFileEncoder();
    encoder.create(path);
    for (final it in entries) {
      final encode = utf8.encode(it.value.join('\n'));
      encoder.addArchiveFile(
        ArchiveFile(
          it.key.name.replaceAll(RegExp(r'.did$'), '.idl.dart'),
          -1,
          encode,
        ),
      );
    }
    encoder.close();
  }
}
