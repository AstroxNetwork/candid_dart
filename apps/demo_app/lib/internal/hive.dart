import 'package:hive_flutter/hive_flutter.dart';

class Hives {
  const Hives._();

  static late final Box _box;

  static Box get box => _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('settings');
  }
}
