import 'package:flutter/material.dart';

import 'data/f_button_theme_data.dart';

export 'data/f_button_theme_data.dart';
export 'colors/f_colors.dart';

class AppTheme extends InheritedTheme {
  const AppTheme({
    Key? key,
    required this.fButtonThemeData,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  // todo 未来改成各种样式，后面再完善
  final FButtonThemeData fButtonThemeData;

  /// Creates a button theme from [fButtonThemeData].
  ///
  /// The [fButtonThemeData] argument must not be null.
  const AppTheme.fromAppThemeData({
    Key? key,
    required this.fButtonThemeData,
    required Widget child,
  }) : super(key: key, child: child);

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

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AppTheme.fromAppThemeData(
        fButtonThemeData: fButtonThemeData, child: child);
  }
}
