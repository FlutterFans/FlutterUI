import 'dart:io';

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
                  return MenuDemo();
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
                          'Main Size: ${constraints.maxWidth} * ${constraints.maxHeight}');
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

class MenuDemo extends StatelessWidget {
  const MenuDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FMenu(
      children: [
        FMenuItem(
          child: Text('FMenuItem1'),
        ),
        FMenuItem(
          child: Text('FMenuItem2'),
        ),
        FMenuGroup(
          groupTitle: 'GroupTitle',
          children: [
            FMenuItem(
              child: Text('FMenuItemGroup1'),
            ),
            FMenuItem(
              child: Text('FMenuItemGroup2'),
            ),
            FMenuGroup(
              groupTitle: 'GroupTitle1',
              children: [
                FMenuItem(
                  child: Text('FMenuItemGroup11'),
                ),
                FMenuItem(
                  child: Text('FMenuItemGroup21'),
                ),
              ],
            ),
          ],
        ),
        FSubMenu(
          children: [
            FMenuItem(
              child: Text('FSubMenuItem1'),
            ),
            FMenuItem(
              child: Text('FSubMenuItem2'),
            ),
            FSubMenu(children: [
              FMenuItem(
                child: Text('FSubSubMenuItem1'),
              ),
              FMenuItem(
                child: Text('FSubSubMenuItem2'),
              ),
            ])
          ],
        ),
      ],
    );
  }
}
