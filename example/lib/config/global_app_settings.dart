import 'package:flutter_ui/flutter_ui.dart';

/// 全局设置配置
class GlobalAppSettings {
  static GlobalAppSettings globalAppSettings = GlobalAppSettings();

  late FButtonThemeData fButtonThemeData;

  GlobalAppSettings() {
    fButtonThemeData = FButtonThemeData();
  }
}
