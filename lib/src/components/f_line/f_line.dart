import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/flutter_ui.dart';

// vertical line
class FVLine extends _FLine {
  const FVLine({
    Key? key,
    bool isDash = false,
    Color lineColor = FColors.lineColor,
    double lineHeight = double.infinity,
    double lineWidth = 1,
    List<double> dashPattern = const <double>[6, 6],
  }) : super(
          key: key,
          isDash: isDash,
          lineColor: lineColor,
          isVertical: true,
          lineHeight: lineHeight,
          lineWidth: lineWidth,
          dashPattern: dashPattern,
        );
}

// horizontal line
class FHLine extends _FLine {
  const FHLine({
    Key? key,
    bool isDash = false,
    Color lineColor = FColors.lineColor,
    double lineHeight = 1,
    double lineWidth = double.infinity,
    List<double> dashPattern = const <double>[6, 6],
  }) : super(
          key: key,
          isDash: isDash,
          isVertical: false,
          lineColor: lineColor,
          lineHeight: lineHeight,
          lineWidth: lineWidth,
          dashPattern: dashPattern,
        );
}

class _FLine extends StatelessWidget {
  const _FLine({
    Key? key,
    this.isDash = false,
    this.isVertical = false,
    this.lineColor = FColors.lineColor,
    this.lineHeight = 1,
    this.lineWidth = double.infinity,
    this.dashPattern = const <double>[6, 6],
  }) : super(key: key);
  final bool isDash;
  final bool isVertical;
  final Color lineColor;
  final double lineHeight;
  final double lineWidth;
  final List<double> dashPattern;

  @override
  Widget build(BuildContext context) {
    if (isDash) {
      return DottedBorder(
        color: lineColor,
        strokeWidth: lineHeight,
        strokeCap: StrokeCap.square,
        dashPattern: dashPattern,
        padding: EdgeInsets.zero,
        customPath: (size) {
          Path path = Path();
          if (isVertical) {
            path
              ..moveTo(0, 0)
              ..lineTo(0, size.height);
          } else {
            path
              ..moveTo(0, 0)
              ..lineTo(size.width, 0);
          }
          return path;
        },
        child: SizedBox(
          width: lineWidth,
          height: lineHeight,
        ),
      );
    } else {
      return Container(
        color: lineColor,
        height: lineHeight,
        width: lineWidth,
      );
    }
  }
}
