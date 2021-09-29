import 'package:flutter_ui/flutter_ui.dart';

class GlobalAppSettings {
  static GlobalAppSettings globalAppSettings = GlobalAppSettings();
  bool isDark = false;

  // 需要跟变量变化的主题数据放在这里就好
  late FButtonThemeData fButtonThemeData;

  GlobalAppSettings() {
    fButtonThemeData = FButtonThemeData();
  }
}
