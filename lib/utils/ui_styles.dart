import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIStyles {
  ///
  /// 获取通用按钮样式
  /// [isStadium] 是否是操场型按钮，如果是，则不需要传角度了
  /// [allRadius] 统一配置所有圆角，也可以配置部分
  /// [normalColor] 按钮正常状态颜色
  /// [pressedColor] 按下状态颜色
  /// [pressedColor] 按下状态颜色
  /// [disableColor] 禁用状态颜色
  /// [width] 固定宽
  /// [height] 固定高
  ///
  static ButtonStyle getCommonButtonStyle({
    Color? borderNormalColor,
    Color? borderPressColor,
    Color? borderDisableColor,
    Color? hoverBorderColor,
    Color? hoverTextColor,
    Color? normalTextColor,
    Color? pressedTextColor,
    Color? focusTextColor,
    Color? textDisableColor,
    SystemMouseCursor? normalCursor,
    SystemMouseCursor? hoverCursor,
    double sideWidth = 0.0,
    bool isStadium = false,
    double borderRadius = 0,
    double allRadius = 0,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    double elevation = 0,
    Color normalColor = Colors.transparent,
    Color? hoverColor,
    Color? pressedColor,
    Color? disableColor,
    Color? focusColor,
    EdgeInsets padding = EdgeInsets.zero,
    double? width,
    double? height,
    double? minWidth,
    double? minHeight,
    double fontSize = 14,
  }) {
    if (allRadius != 0) {
      topLeft = allRadius;
      topRight = allRadius;
      bottomLeft = allRadius;
      bottomRight = allRadius;
    }
    return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith((states) {
        // 字体颜色会被前景色覆盖
        if (pressedTextColor != null &&
            states.contains(MaterialState.pressed)) {
          return TextStyle(color: pressedTextColor, fontSize: fontSize);
        }
        if (hoverTextColor != null && states.contains(MaterialState.hovered)) {
          return TextStyle(color: hoverTextColor, fontSize: fontSize);
        }
        if (focusTextColor != null && states.contains(MaterialState.focused)) {
          return TextStyle(color: focusTextColor, fontSize: fontSize);
        }
        if (textDisableColor != null &&
            states.contains(MaterialState.disabled)) {
          return TextStyle(color: textDisableColor, fontSize: fontSize);
        }
        return TextStyle(color: normalTextColor, fontSize: fontSize);
      }),
      side: borderNormalColor != null
          ? MaterialStateProperty.resolveWith((states) {
              if (borderPressColor != null &&
                  states.contains(MaterialState.pressed)) {
                return BorderSide(color: borderPressColor, width: sideWidth);
              }
              if (hoverBorderColor != null &&
                  states.contains(MaterialState.hovered)) {
                return BorderSide(color: hoverBorderColor, width: sideWidth);
              }
              if (borderDisableColor != null &&
                  states.contains(MaterialState.disabled)) {
                return BorderSide(color: borderDisableColor, width: sideWidth);
              }
              //默认不使用背景颜色
              return BorderSide(color: borderNormalColor, width: sideWidth);
            })
          : null,
      mouseCursor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return SystemMouseCursors.click;
        }
        if (hoverCursor != null && states.contains(MaterialState.hovered)) {
          return hoverCursor;
        }
        if (states.contains(MaterialState.disabled)) {
          return SystemMouseCursors.forbidden;
        }
        return normalCursor ?? SystemMouseCursors.click;
      }),
      shape: MaterialStateProperty.all(
        isStadium
            ? const StadiumBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft),
                  topRight: Radius.circular(topRight),
                  bottomLeft: Radius.circular(bottomLeft),
                  bottomRight: Radius.circular(bottomRight),
                ),
              ),
      ),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize:
          MaterialStateProperty.all(Size(minWidth ?? 0, minHeight ?? 0)),
      fixedSize: MaterialStateProperty.all(
          Size(width ?? double.infinity, height ?? double.infinity)),
      padding: MaterialStateProperty.all(padding),
      splashFactory: NoSplash.splashFactory,
      elevation: MaterialStateProperty.all(elevation),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (pressedTextColor != null &&
            states.contains(MaterialState.pressed)) {
          return pressedTextColor;
        }
        if (hoverTextColor != null && states.contains(MaterialState.hovered)) {
          return hoverTextColor;
        }
        if (focusTextColor != null && states.contains(MaterialState.focused)) {
          return focusTextColor;
        }
        if (textDisableColor != null &&
            states.contains(MaterialState.disabled)) {
          return textDisableColor;
        }
        return normalTextColor;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (pressedColor != null && states.contains(MaterialState.pressed)) {
          return pressedColor;
        }
        if (states.contains(MaterialState.hovered)) {
          return hoverColor;
        }
        if (focusColor != null && states.contains(MaterialState.focused)) {
          return focusColor;
        }
        if (disableColor != null && states.contains(MaterialState.disabled)) {
          return disableColor;
        }
        //默认不使用背景颜色
        return normalColor;
      }),
    );
  }
}
