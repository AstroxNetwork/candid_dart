import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class SimpleImage extends StatelessWidget {
  SimpleImage(
    this.image, {
    super.key,
    this.bundle,
    this.package,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.alignment = Alignment.center,
    this.cacheWidth,
    this.cacheHeight,
  });

  final String image;
  final AssetBundle? bundle;
  final String? package;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final int? cacheWidth;
  final int? cacheHeight;

  late final _path = image.toLowerCase();

  late final isNetwork = _path.startsWith(RegExp('http(s?)://'));

  late final isBase64 = RegExp('data:.+;base64,').hasMatch(_path);

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: Placeholder(
          fallbackHeight: height ?? double.infinity,
          fallbackWidth: width ?? double.infinity,
        ),
      );
    }
    if (isNetwork) {
      return Image.network(
        image,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
      );
    }
    if (isBase64) {
      final data = image.split('base64,').last;
      final bytes = Uint8List.fromList(base64Decode(data));
      return Image.memory(
        bytes,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
      );
    }
    return Image.asset(
      image,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      color: color,
      fit: fit,
      alignment: alignment,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }
}
