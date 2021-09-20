import 'package:flutter_ui/flutter_ui.dart';

class GlobalAppSettings {
  static GlobalAppSettings globalAppSettings = GlobalAppSettings();
  bool isDark = false;

  late FButtonThemeData fButtonThemeData;

  GlobalAppSettings() {
    fButtonThemeData = FButtonThemeData();
  }
}
