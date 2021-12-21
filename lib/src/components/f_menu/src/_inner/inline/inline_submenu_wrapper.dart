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
import 'menu_slide_panel.dart';

class InlineSubMenuWrapper extends StatefulWidget {
  final MenuClick onMenuClick;
  final FSubMenu item;
  final double menuItemPadding;
  final bool isExpanded;
  final List<Widget> children;

  const InlineSubMenuWrapper({
    Key? key,
    required this.onMenuClick,
    required this.item,
    required this.children,
    this.menuItemPadding = 0,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<InlineSubMenuWrapper> createState() => _InlineSubMenuWrapperState();
}

class _InlineSubMenuWrapperState extends State<InlineSubMenuWrapper> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InlineSubMenuWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      isExpanded = widget.isExpanded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuThemeData = AppTheme.of(context).fMenuThemeData;
    Widget title = Text(
      widget.item.subMenuTitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
    if (widget.item.icon != null) {
      title = Row(
        children: [
          Transform(
            transform: Matrix4.translationValues(0, 1, 0),
            child: IconTheme.merge(
              data: IconThemeData(
                size: menuThemeData.menuFontSize,
              ),
              child: widget.item.icon!,
            ),
          ),
          const SizedBox(width: 10),
          title,
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onHover: (bool isHover) {},
          onPressed: () {
            isExpanded = !isExpanded;
            setState(() {});
          },
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
          child: Container(
            padding: EdgeInsets.only(
              left: widget.menuItemPadding,
              right: fMenuPaddingRight,
            ),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: fMenuItemHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: const Color(0xff909399),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
        MenuSlidePanel(
          isMenuOpen: isExpanded,
          child: ColoredBox(
            color: menuThemeData.subMenuBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
