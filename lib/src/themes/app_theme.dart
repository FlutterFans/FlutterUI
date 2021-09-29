import 'package:flutter/material.dart';

import 'data/f_button_theme_data.dart';
import 'data/f_menu_theme_data.dart';

export 'colors/f_colors.dart';
export 'data/f_button_theme_data.dart';
export 'data/f_menu_theme_data.dart';
export 'dimens/f_dimens.dart';

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

  static T of<T extends AppTheme>(BuildContext context) {
    final T? inheritedButtonTheme = context.dependOnInheritedWidgetOfExactType<T>();
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
    return (fButtonThemeData != oldWidget.fButtonThemeData || fMenuThemeData != oldWidget.fMenuThemeData);
  }
}
