import 'dart:async';
import 'dart:convert';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';

void saveFile({
  required Uint8List bytes,
  required String name,
}) {
  // prepare
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    // ignore: unsafe_html
    ..href = url
    ..style.display = 'none'
    ..download = name;
  html.document.body!.children.add(anchor);
  // download
  anchor.click();
  // cleanup
  html.document.body!.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}

Future<void> save(List<MapEntry<PlatformFile, List<String>>> entries) async {
  if (entries.isEmpty) {
    return;
  }
  if (entries.length == 1) {
    final entry = entries.first;
    final encode = utf8.encode(entry.value.join('\n'));
    saveFile(
      bytes: encode as Uint8List,
      name: entry.key.name.replaceAll(RegExp(r'.did$'), '.idl.dart'),
    );
  } else {
    final archive = Archive();
    for (final it in entries) {
      final encode = utf8.encode(it.value.join('\n'));
      archive.addFile(
        ArchiveFile(
          it.key.name.replaceAll(RegExp(r'.did$'), '.idl.dart'),
          -1,
          encode,
        ),
      );
    }
    final zipEncoder = ZipEncoder();
    final encode = zipEncoder.encode(archive);
    saveFile(bytes: encode as Uint8List, name: 'dart_idls.zip');
  }
}
