import 'dart:convert';
import 'dart:ui';

import 'package:candid_dart_core/core.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/idea.dart';

import 'extensions.dart';
import 'notifiers.dart';
import 'res/assets.gen.dart';
import 'res/fonts.gen.dart';
import 'save/save_io.dart' if (dart.library.html) 'save/save_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'did2dart',
      scrollBehavior: const ScrollBehavior().copyWith(
        scrollbars: false,
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.agave,
      ),
      themeMode: ThemeMode.light,
      home: const MyHomePage(title: 'did2dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dids =
      NewValueNotifier<List<MapEntry<PlatformFile, List<String>>>>([]);
  final _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: _dids,
          builder: (context, value, child) {
            if (value.isEmpty) {
              return Text(widget.title);
            }
            return Text('${widget.title} (${value.length})');
          },
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: _dids,
            builder: (context, value, child) {
              if (value.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: () {
                  save(value);
                },
                icon: const Icon(Icons.download_rounded),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _dids,
            builder: (context, value, child) {
              if (value.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: () {
                  _dids.newValue(_dids.value..clear());
                },
                icon: const Icon(Icons.clear_all_rounded),
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _loading,
        builder: (context, loading, child) {
          if (loading) {
            return Align(
              alignment: const AlignmentDirectional(0.0, -0.28),
              child: Assets.loading.lottie(
                width: (MediaQuery.of(context).size.width * 0.8)
                    .coerceAtMost(720.0),
              ),
            );
          }
          return _buildBody();
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Pick .did',
        onPressed: () async {
          _loading.value = true;
          try {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['did'],
              allowMultiple: true,
              withReadStream: true,
            );
            final files = result?.files;
            if (files == null || files.isEmpty) {
              return;
            }
            final list = await List.generate(files.length, (index) async {
              final file = files[index];
              final str = await file.readStream!.transform(utf8.decoder).first;
              final code = did2dart(file.name, str);
              final codes = code
                  .split('\n')
                  .slices(256)
                  .map((e) => e.join('\n'))
                  .toList();
              return MapEntry(file, codes);
            }).wait();
            _dids.newValue(list);
          } finally {
            _loading.value = false;
          }
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
      valueListenable: _dids,
      builder: (context, value, child) {
        if (value.isEmpty) {
          return Align(
            alignment: const AlignmentDirectional(0.0, -0.28),
            child: Assets.empty.lottie(
              width: (MediaQuery.of(context).size.width * 0.42)
                  .coerceAtMost(480.0),
            ),
          );
        }
        return DefaultTabController(
          length: value.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabBar(value),
              Expanded(
                child: _buildTabView(value),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBar(List<MapEntry<PlatformFile, List<String>>> value) {
    return TabBar(
      isScrollable: true,
      tabs: List.generate(
        value.length,
        (index) {
          final entry = value[index];
          return Tab(
            height: 40.0,
            child: Row(
              children: [
                Text(entry.key.name),
                IconButton(
                  onPressed: () {
                    _dids.newValue(_dids.value..remove(entry));
                  },
                  icon: const Icon(
                    Icons.clear_rounded,
                    size: 14.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabView(List<MapEntry<PlatformFile, List<String>>> value) {
    return TabBarView(
      children: List.generate(
        value.length,
        (index) {
          final entry = value[index];
          final codes = entry.value;
          final length = codes.length;
          return ListView.builder(
            itemBuilder: (context, index) {
              return HighlightView(
                codes[index],
                language: 'dart',
                textStyle: const TextStyle(
                  fontFamily: FontFamily.agave,
                  height: 1.5,
                ),
                theme: ideaTheme,
                padding: index == 0
                    ? const EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        top: 24.0,
                      )
                    : index == length - 1
                        ? const EdgeInsets.only(
                            left: 24.0,
                            right: 24.0,
                            bottom: 24.0,
                          )
                        : const EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
              );
            },
            itemCount: length,
          );
        },
      ),
    );
  }
}
