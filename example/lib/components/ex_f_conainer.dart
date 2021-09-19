import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';

class ExFContainer extends StatelessWidget {
  const ExFContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTheme = AppTheme.of(context).fButtonThemeData;
    return FContainer(
      axis: Axis.vertical,
      children: [
        FHeader(
          height: 80,
          child: Row(
            children: [
              Text(
                'Flutter UI',
                style: TextStyle(
                  color: buttonTheme.normalColor,
                  fontSize: 28,
                ),
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Text(
                      'Header: ${constraints.maxWidth} * ${constraints.maxHeight}');
                },
              )
            ],
          ),
        ),
        FHLine(),
        FContainer(
          axis: Axis.horizontal,
          children: [
            FAside(
              width: 240,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Text(
                      'Size: ${constraints.maxWidth} * ${constraints.maxHeight}');
                },
              ),
            ),
            FVLine(),
            FContainer(
              axis: Axis.vertical,
              children: [
                FMain(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Text(
                          'MainSize: ${constraints.maxWidth} * ${constraints.maxHeight}');
                    },
                  ),
                ),
                FHLine(),
                FFooter(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Text(
                          'Footer: ${constraints.maxWidth} * ${constraints.maxHeight}');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
