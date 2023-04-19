import 'dart:async';

import 'package:agent_dart/agent_dart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:oktoast/oktoast.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _ok = false;

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: (capture) {
        if (_ok) {
          return;
        }
        final barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          final value = barcode.rawValue?.trim();
          if (value != null) {
            try {
              final principal = Principal.fromText(value);
              _ok = true;
              Navigator.pop(context, principal.toText());
            } catch (e) {
              _timer ??= Timer(const Duration(seconds: 3), () {
                showToast('Please scan the correct principal QR code.');
                _timer = null;
              });
            }
          }
        }
      },
    );
  }
}
