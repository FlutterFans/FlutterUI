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
import 'package:tuple/tuple.dart';

import '../../f_base_menu.dart';
import '../../f_menu_constants.dart';
import 'inline_menu_wrapper.dart';
import 'inline_submenu_wrapper.dart';

class InlineMenuHandler {
  static List<Widget> createInlineMenu({
    required List<FBaseMenu> children,
    required AppTheme appTheme,
    required MenuClick onMenuClick,
    List<dynamic>? selectedMenuKeys,
  }) {
    double initPadding = fMenuPaddingLeft;
    final menuThemeData = appTheme.fMenuThemeData;

    Tuple2<List<Widget>, FBaseMenu?> _handleInlineChildren(
      List<FBaseMenu> children,
      double menuItemPadding,
      FMenuThemeData menuThemeData,
      FBaseMenu? parentMenu,
    ) {
      List<Widget> newItems = [];
      FBaseMenu? selectedParentMenu;
      for (var item in children) {
        if (item is FMenuItem) {
          bool isSelected = false;
          if (selectedMenuKeys != null && selectedMenuKeys.contains(item.menuKey)) {
            isSelected = true;
            selectedParentMenu = parentMenu;
          }
          newItems.add(InlineMenuWrapper(
            menuItemPadding: menuItemPadding,
            item: item,
            isSelected: isSelected,
            onMenuClick: onMenuClick,
          ));
        } else if (item is FMenuGroup) {
          final result = _handleInlineChildren(
            item.children,
            menuItemPadding, // menuGroup 跟menu对齐
            menuThemeData,
            item,
          );
          if (result.item2 != null) {
            selectedParentMenu = item;
          }
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
          newItems.addAll(result.item1);
        } else if (item is FSubMenu) {
          final result = _handleInlineChildren(
            item.children,
            menuItemPadding + fSubMenuPaddingLeft,
            menuThemeData,
            item,
          );
          if (result.item2 != null) {
            selectedParentMenu = item;
          }
          newItems.add(InlineSubMenuWrapper(
            menuItemPadding: menuItemPadding,
            item: item,
            isExpanded: item == selectedParentMenu || item.isExpanded,
            onMenuClick: onMenuClick,
            children: result.item1,
          ));
        }
      }
      return Tuple2(newItems, selectedParentMenu);
    }

    return _handleInlineChildren(children, initPadding, menuThemeData, null).item1;
  }
}
