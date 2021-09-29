import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:flutter_ui/src/components/f_menu/src/f_base_menu.dart';

import '../../base_widget.dart';
import 'f_menu_constants.dart';

class FMenuItem extends BaseWidget with FBaseMenu {
  final Widget child;
  /// 菜单的唯一标识
  final dynamic menuKey;
  final Widget? icon;

  const FMenuItem({
    Key? key,
    required this.child,
    required this.menuKey,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget item = child;
    if (icon != null) {
      final menuThemeData = AppTheme.of(context).fMenuThemeData;
      item = Row(
        children: [
          Transform(
            transform: Matrix4.translationValues(0, 1, 0),
            child: IconTheme.merge(
              data: IconThemeData(
                size: menuThemeData.menuFontSize,
              ),
              child: icon!,
            ),
          ),
          const SizedBox(width: 10),
          item,
        ],
      );
    }
    return Container(
      height: fMenuItemHeight,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: item,
    );
  }
}
