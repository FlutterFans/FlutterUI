//
//  inline_menu_handler
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:flutter_ui/src/components/f_menu/src/_inner/inline/inline_menu_wrapper.dart';
import 'package:flutter_ui/src/components/f_menu/src/_inner/inline/inline_submenu_wrapper.dart';

import '../../f_base_menu.dart';
import '../../f_menu_constants.dart';
import 'vertical_submenu_wrapper.dart';

class VerticalMenuHandler {
  static List<Widget> createInlineMenu(
    List<FBaseMenu> children,
    AppTheme appTheme,
    List<FocusNode> focusNodes,
    MenuClick onMenuClick,
  ) {
    double initPadding = fMenuPaddingLeft;
    focusNodes.clear();
    final menuThemeData = appTheme.fMenuThemeData;

    List<Widget> _handleInlineChildren(
      List<FBaseMenu> children,
      double menuItemPadding,
      FMenuThemeData menuThemeData,
    ) {
      List<Widget> newItems = [];
      for (var item in children) {
        if (item is FMenuItem) {
          final node = FocusNode();
          focusNodes.add(node);
          newItems.add(InlineMenuWrapper(
            menuItemPadding: menuItemPadding,
            node: node,
            item: item,
            onMenuClick: onMenuClick,
          ));
        } else if (item is FMenuGroup) {
          newItems.add(Container(
            height: fGroupMenuItemHeight,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: menuItemPadding,
            ),
            child: Text(
              item.groupTitle,
              style: TextStyle(
                color: menuThemeData.groupTextColor,
                fontSize: menuThemeData.groupTextSize,
              ),
            ),
          ));
          newItems.addAll(_handleInlineChildren(
            item.children,
            menuItemPadding, // menuGroup 跟menu对齐
            menuThemeData,
          ));
        } else if (item is FSubMenu) {
          newItems.add(VerticalSubMenuWrapper(
            menuItemPadding: menuItemPadding,
            item: item,
            onMenuClick: onMenuClick,
            children: _handleInlineChildren(
              item.children,
              menuItemPadding + fSubMenuPaddingLeft,
              menuThemeData,
            ),
          ));
        }
      }
      return newItems;
    }

    return _handleInlineChildren(children, initPadding, menuThemeData);
  }
}
