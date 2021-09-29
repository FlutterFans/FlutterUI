import 'package:flutter/material.dart';

class FMenuThemeDataDark extends FMenuThemeData {
  const FMenuThemeDataDark({
    double menuFontSize = 14,
    Color menuBackgroundColor = const Color(0xff001529),
    Color normalTextColor = const Color(0xa6ffffff),
    Color pressedTextColor = Colors.white,
    Color focusTextColor = Colors.white,
    Color hoverTextColor = Colors.white,
    Color normalColor = Colors.transparent,
    Color pressedColor = const Color(0xff1890ff),
    Color hoverColor = const Color(0xff1890ff),
    Color focusColor = const Color(0xff1890ff),
    double groupTextSize = 12,
    Color groupTextColor = const Color(0xff909399),
  }) : super(
          menuBackgroundColor: menuBackgroundColor,
          menuFontSize: menuFontSize,
          normalTextColor: normalTextColor,
          pressedTextColor: pressedTextColor,
          focusTextColor: focusTextColor,
          hoverTextColor: hoverTextColor,
          normalColor: normalColor,
          pressedColor: pressedColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
          groupTextColor: groupTextColor,
          groupTextSize: groupTextSize,
        );
}

class FMenuThemeData {
  /// 菜单字体大小
  final double menuFontSize;

  /// 菜单背景颜色
  final Color menuBackgroundColor;

  /// 菜单正常态字体颜色
  final Color normalTextColor;

  /// 菜单按下态字体颜色
  final Color pressedTextColor;

  /// 菜单聚焦态字体颜色
  final Color focusTextColor;

  /// 菜单悬浮态字体颜色
  final Color hoverTextColor;

  /// 菜单正常态背景颜色
  final Color normalColor;

  /// 菜单按下态背景颜色
  final Color pressedColor;

  /// 菜单悬浮态背景颜色
  final Color hoverColor;
  final Color focusColor;

  /// 菜单组字体大小
  final double groupTextSize;

  /// 菜单组字体颜色
  final Color groupTextColor;

  const FMenuThemeData({
    this.menuFontSize = 14,
    this.menuBackgroundColor = Colors.white,
    this.normalTextColor = const Color(0xff333333),
    this.pressedTextColor = const Color(0xff1890ff),
    this.focusTextColor = const Color(0xff1890ff),
    this.hoverTextColor = const Color(0xff1890ff),
    this.normalColor = Colors.transparent,
    this.pressedColor = const Color(0xffe6f7ff),
    this.hoverColor = const Color(0xffe6f7ff),
    this.focusColor = const Color(0xffe6f7ff),
    this.groupTextSize = 12,
    this.groupTextColor = const Color(0xff909399),
  });

  FMenuThemeData copyWith({
    double? menuFontSize,
    Color? normalTextColor,
    Color? pressedTextColor,
    Color? focusTextColor,
    Color? hoverTextColor,
    Color? normalColor,
    Color? pressedColor,
    Color? hoverColor,
    Color? focusColor,
    double? groupTextSize,
    Color? groupTextColor,
  }) {
    return FMenuThemeData(
      menuFontSize: menuFontSize ?? this.menuFontSize,
      normalTextColor: normalTextColor ?? this.normalTextColor,
      pressedTextColor: pressedTextColor ?? this.pressedTextColor,
      focusTextColor: focusTextColor ?? this.focusTextColor,
      hoverTextColor: hoverTextColor ?? this.hoverTextColor,
      normalColor: normalColor ?? this.normalColor,
      pressedColor: pressedColor ?? this.pressedColor,
      hoverColor: hoverColor ?? this.hoverColor,
      focusColor: focusColor ?? this.focusColor,
      groupTextSize: groupTextSize ?? this.groupTextSize,
      groupTextColor: groupTextColor ?? this.groupTextColor,
    );
  }
}
