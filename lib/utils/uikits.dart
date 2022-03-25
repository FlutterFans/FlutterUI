import 'dart:ui';

import 'package:flutter/material.dart';

/// 全局通用样式
class UIkit {
  static const commonShadow = BoxShadow(color: Color.fromARGB(25, 57, 77, 187), offset: Offset(0, 2), blurRadius: 10);

  static Widget getHorizontalLine({Color? color, double height = 0.3}) {
    return Container(
      height: height,
      color: color ?? const Color(0xff363636),
    );
  }

  static Widget getVerticalLine({Color? color}) {
    return Container(
      width: 0.3,
      color: color ?? const Color(0xff363636),
    );
  }

  static Widget getLoadingIndicator([double size = 36]) => SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff83f20)),
        ),
      );

  static TextStyle style(int color, double fontSize, [bool isBold = false]) {
    return TextStyle(
      color: color == 0 ? null : Color(color),
      fontSize: fontSize,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Decoration getDecoration({
    Color? color,
    double allRadius = 0,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    double borderSize = 0,
    Color? borderColor,
    Gradient? gradient,
    BlendMode? blendMode,
    String? image,
    BoxFit? fit,
    Alignment? imageAlignment,
    List<BoxShadow>? shadows,
  }) {
    if (allRadius != 0) {
      topLeft = allRadius;
      topRight = allRadius;
      bottomLeft = allRadius;
      bottomRight = allRadius;
    }
    return BoxDecoration(
      boxShadow: shadows,
      color: color ?? Colors.transparent,
      gradient: gradient,
      image: image != null
          ? DecorationImage(
              image: AssetImage(image),
              fit: fit,
              alignment: imageAlignment ?? Alignment.center,
            )
          : null,
      backgroundBlendMode: blendMode,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      border: borderSize == 0
          ? null
          : Border.all(
              color: borderColor ?? Colors.white,
              width: borderSize,
            ),
    );
  }

  static Widget getProgressIndicator(bool isLoading) {
    // Image.network(
    //     'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
    //     color: const Color.fromRGBO(255, 255, 255, 0.5),
    //     colorBlendMode: BlendMode.modulate
    // )
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Offstage(
          offstage: !isLoading,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  ///
  /// 获取通用按钮样式
  /// [isStadium] 是否是操场型按钮，如果是，则不需要传角度了
  /// [allRadius] 统一配置所有圆角，也可以配置部分
  /// [normalColor] 正常状态颜色
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
    Color? textNormalColor,
    Color? textPressColor,
    Color? textDisableColor,
    double sideWidth = 0.0,
    bool isStadium = false,
    double borderRadius = 0,
    double allRadius = 0,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
    double elevation = 0,
    required Color normalColor,
    Color? pressedColor,
    Color? disableColor,
    EdgeInsets padding = EdgeInsets.zero,
    double? width,
    double? height,
    double? minWidth,
    double? minHeight,
  }) {
    if (allRadius != 0) {
      topLeft = allRadius;
      topRight = allRadius;
      bottomLeft = allRadius;
      bottomRight = allRadius;
    }
    return ButtonStyle(
      side: borderNormalColor != null
          ? MaterialStateProperty.resolveWith((states) {
              if (borderPressColor != null && states.contains(MaterialState.pressed)) {
                return BorderSide(color: borderPressColor, width: sideWidth);
              }
              if (borderDisableColor != null && states.contains(MaterialState.disabled)) {
                return BorderSide(color: borderDisableColor, width: sideWidth);
              }
              //默认不使用背景颜色
              return BorderSide(color: borderNormalColor, width: sideWidth);
            })
          : null,
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
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: MaterialStateProperty.all(Size(minWidth ?? 0, minHeight ?? 0)),
      fixedSize: MaterialStateProperty.all(Size(width ?? double.infinity, height ?? double.infinity)),
      padding: MaterialStateProperty.all(padding),
      splashFactory: NoSplash.splashFactory,
      elevation: MaterialStateProperty.all(elevation),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (textPressColor != null && states.contains(MaterialState.pressed)) {
          return textPressColor;
        }
        if (textDisableColor != null && states.contains(MaterialState.disabled)) {
          return textDisableColor;
        }
        return textNormalColor;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (pressedColor != null && states.contains(MaterialState.pressed)) {
          return pressedColor;
        }
        if (disableColor != null && states.contains(MaterialState.disabled)) {
          return disableColor;
        }
        //默认不使用背景颜色
        return normalColor;
      }),
    );
  }

  static ButtonStyle getYellowFillButton({
    double height = 40,
    double? width,
    EdgeInsets padding = EdgeInsets.zero,
    double? minWidth,
    double? minHeight,
    double? allRadius,
    bool isStadium = false,
    Color? normalColor,
  }) {
    return getCommonButtonStyle(
      normalColor: normalColor ?? const Color(0xffAC9147),
      pressedColor: const Color(0xffb09954),
      disableColor: const Color(0xff333333),
      textNormalColor: Colors.white,
      textDisableColor: const Color(0xffCDCDCD),
      allRadius: allRadius ?? 5,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      padding: padding,
      isStadium: isStadium,
    );
  }

  static ButtonStyle getRedFillButton({
    double height = 40,
    double? width,
    EdgeInsets padding = EdgeInsets.zero,
    double? minWidth,
    double? minHeight,
    double? allRadius,
    bool isStadium = false,
    Color? normalColor,
  }) {
    return getCommonButtonStyle(
      normalColor: normalColor ?? const Color(0xffDC2D1E),
      pressedColor: const Color(0xffFF5E64),
      disableColor: const Color(0xff333333),
      textNormalColor: Colors.white,
      textDisableColor: const Color(0xffCDCDCD),
      allRadius: allRadius ?? 5,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      padding: padding,
      isStadium: isStadium,
    );
  }

  static ButtonStyle getRedBorderButton({
    double height = 40,
    double? width,
    EdgeInsets padding = EdgeInsets.zero,
    double? minWidth,
    double? minHeight,
    bool isStadium = false,
  }) {
    return getCommonButtonStyle(
      isStadium: isStadium,
      normalColor: Colors.transparent,
      borderNormalColor: const Color(0xffDC2D1E),
      borderPressColor: const Color(0xffE46D72),
      borderDisableColor: const Color(0xffFFCCCE),
      textNormalColor: const Color(0xffDC2D1E),
      textPressColor: Colors.black,
      textDisableColor: const Color(0xffFFCCCE),
      sideWidth: 1,
      allRadius: 5,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      padding: padding,
    );
  }

  static ButtonStyle getBlackBorderButton({
    double height = 40,
    double? width,
    EdgeInsets padding = EdgeInsets.zero,
    double? minWidth,
    double? minHeight,
    bool isStadium = false,
  }) {
    return getCommonButtonStyle(
      normalColor: Colors.white,
      borderNormalColor: Colors.black,
      borderPressColor: const Color(0xffA6A6A6),
      borderDisableColor: const Color(0xffCCCCCC),
      textNormalColor: Colors.black,
      textPressColor: Colors.black,
      textDisableColor: const Color(0xffCCCCCC),
      sideWidth: 1.5,
      allRadius: 5,
      isStadium: isStadium,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      padding: padding,
    );
  }

  static ButtonStyle getBlackFillButton({
    double height = 40,
    double? width,
    EdgeInsets padding = EdgeInsets.zero,
    double? minWidth,
    double? minHeight,
    bool isStadium = false,
  }) {
    return getCommonButtonStyle(
      normalColor: Colors.black,
      pressedColor: const Color(0xff4B4B4B),
      disableColor: Colors.black.withOpacity(0.2),
      textNormalColor: Colors.white,
      sideWidth: 1.5,
      allRadius: 5,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      padding: padding,
      isStadium: isStadium,
    );
  }

  static ButtonStyle getWhiteFillButton({
    double height = 40,
    double? width,
    EdgeInsets padding = EdgeInsets.zero,
    double? minWidth,
    double? minHeight,
    bool isStadium = false,
  }) {
    return getCommonButtonStyle(
      normalColor: const Color(0xffFAFAFA),
      pressedColor: Colors.black.withOpacity(0.08),
      disableColor: const Color(0xffFAFAFA),
      textNormalColor: Colors.black,
      textDisableColor: const Color(0xffCCCCCC),
      sideWidth: 1.5,
      allRadius: 5,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      padding: padding,
      isStadium: isStadium,
    );
  }

  static TextStyle getTextStyle(Color color, double fontSize, [bool isBold = false]) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }
}
