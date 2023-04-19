import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';

import 'internal/hive.dart';
import 'internal/token.dart';
import 'ui/home.dart';
import 'ui/scanner.dart';
import 'ui/token.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hives.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: ValueListenableBuilder(
        valueListenable: Hives.box.listenable(),
        builder: (context, box, child) {
          final mode =
              box.get('theme_mode', defaultValue: ThemeMode.system.name);
          final color = Color(
            box.get('theme_color', defaultValue: Colors.blueAccent.value),
          );
          return MaterialApp(
            title: 'Flutter Demo',
            scrollBehavior: const ScrollBehavior().copyWith(
              scrollbars: false,
              dragDevices: PointerDeviceKind.values.toSet(),
            ),
            themeMode: ThemeMode.values.firstWhere((e) => e.name == mode),
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorSchemeSeed: color,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: color,
            ),
            initialRoute: '/',
            onGenerateRoute: (route) {
              Widget? page;
              switch (route.name) {
                case '/':
                  page = const Home();
                  break;
                case '/scan':
                  page = const Scanner();
                  break;
                case '/token':
                  page = TokenDetails(token: route.arguments as Token);
                  break;
              }
              return MaterialPageRoute(
                builder: (context) =>
                    page ??
                    const Scaffold(
                      body: Center(
                        child: Text('Page not found'),
                      ),
                    ),
              );
            },
          );
        },
      ),
    );
  }
}
