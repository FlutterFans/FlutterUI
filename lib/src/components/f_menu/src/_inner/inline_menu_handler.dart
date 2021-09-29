//
//  inline_menu_handler
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/flutter_ui.dart';

import '../f_base_menu.dart';
import '../f_menu_constants.dart';
import 'inline_menu_wrapper.dart';
import 'inline_submenu_wrapper.dart';

class InlineMenuHandler {
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
            padding: EdgeInsets.only(
              left: menuItemPadding + fMenuGroupPaddingLeft,
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
            menuItemPadding + fMenuGroupPaddingLeft, // menuGroup 跟menu对齐
            menuThemeData,
          ));
        } else if (item is FSubMenu) {
          newItems.add(InlineSubMenuWrapper(
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
