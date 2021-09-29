//
//  InlineMenuWrapper
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//
import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:flutter_ui/utils/ui_styles.dart';

import '../f_menu_constants.dart';

class InlineMenuWrapper extends StatelessWidget {
  final FocusNode? node;
  final MenuClick onMenuClick;
  final FMenuItem item;
  final double menuItemPadding;

  const InlineMenuWrapper({
    Key? key,
    this.node,
    required this.onMenuClick,
    required this.item,
    this.menuItemPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuThemeData = AppTheme.of(context).fMenuThemeData;
    return TextButton(
      onHover: (bool isHover) {},
      onPressed: () {
        node?.requestFocus();
        onMenuClick(item.menuKey);
      },
      focusNode: node,
      style: UIStyles.getCommonButtonStyle(
        normalColor: menuThemeData.normalColor,
        pressedColor: menuThemeData.pressedColor,
        hoverColor: menuThemeData.hoverColor,
        focusColor: menuThemeData.focusColor,
        normalTextColor: menuThemeData.normalTextColor,
        pressedTextColor: menuThemeData.pressedTextColor,
        focusTextColor: menuThemeData.focusTextColor,
        hoverTextColor: menuThemeData.hoverTextColor,
        fontSize: menuThemeData.menuFontSize,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: menuItemPadding,
          right: fMenuPaddingRight,
        ),
        child: item,
      ),
    );
  }
}
