import 'package:flutter/material.dart';

import 'data/f_button_theme_data.dart';
import 'data/f_menu_theme_data.dart';

export 'data/f_button_theme_data.dart';
export 'data/f_menu_theme_data.dart';
export 'colors/f_colors.dart';
export 'dimens/f_dimens.dart';

///
/// Dark Theme
///
class DarkTheme extends AppTheme {
  const DarkTheme({
    Key? key,
    FButtonThemeData fButtonThemeData = const FButtonThemeDataDark(),
    FMenuThemeData fMenuThemeData = const FMenuThemeDataDark(),
    required Widget child,
  }) : super(
          key: key,
          child: child,
          fButtonThemeData: fButtonThemeData,
          fMenuThemeData: fMenuThemeData,
        );
}

/// Normal Theme
class AppTheme extends InheritedWidget {
  final FButtonThemeData fButtonThemeData;
  final FMenuThemeData fMenuThemeData;

  const AppTheme({
    Key? key,
    this.fButtonThemeData = const FButtonThemeData(),
    this.fMenuThemeData = const FMenuThemeData(),
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static AppTheme of(BuildContext context) {
    final AppTheme? inheritedButtonTheme =
        context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedButtonTheme != null, '''
    Please initialize!
    Example:
    AppTheme(
      child:MaterialApp(
      title: 'Xxxx Demo',
      )
    );
    ''');
    return inheritedButtonTheme!;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return fButtonThemeData != oldWidget.fButtonThemeData;
  }
}
