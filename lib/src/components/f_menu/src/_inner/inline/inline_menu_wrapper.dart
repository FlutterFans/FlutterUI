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

import '../../f_menu_constants.dart';

class InlineMenuWrapper extends StatelessWidget {
  final MenuClick onMenuClick;
  final FMenuItem item;
  final double menuItemPadding;
  final bool isSelected;

  const InlineMenuWrapper({
    Key? key,
    this.isSelected = false,
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
        onMenuClick(item.menuKey);
      },
      style: UIStyles.getCommonButtonStyle(
        normalColor: isSelected ? menuThemeData.focusColor : menuThemeData.normalColor,
        pressedColor: isSelected ? menuThemeData.focusColor : menuThemeData.pressedColor,
        hoverColor: isSelected ? menuThemeData.focusColor : menuThemeData.hoverColor,
        focusColor: menuThemeData.focusColor,
        normalTextColor: isSelected ? menuThemeData.focusTextColor : menuThemeData.normalTextColor,
        pressedTextColor: isSelected ? menuThemeData.focusTextColor : menuThemeData.pressedTextColor,
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
