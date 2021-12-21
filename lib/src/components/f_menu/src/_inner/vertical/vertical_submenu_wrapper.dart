//
//  InlineMenuWrapper
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//
import 'dart:math' as math;

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:flutter_ui/utils/ui_styles.dart';

import '../../f_menu_constants.dart';

class VerticalSubMenuWrapper extends StatefulWidget {
  final MenuClick onMenuClick;
  final FSubMenu item;
  final double menuItemPadding;
  final List<Widget> children;

  const VerticalSubMenuWrapper({
    Key? key,
    required this.onMenuClick,
    required this.item,
    required this.children,
    this.menuItemPadding = 0,
  }) : super(key: key);

  @override
  State<VerticalSubMenuWrapper> createState() => _VerticalSubMenuWrapperState();
}

class _VerticalSubMenuWrapperState extends State<VerticalSubMenuWrapper> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VerticalSubMenuWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget buildHoverMenu(Function cancelFunc) {
    final RenderBox? button = context.findRenderObject() as RenderBox?;
    if (button == null) {
      return Container();
    }
    final position = button.localToGlobal(button.size.bottomRight(Offset.zero));

    final menuThemeData = AppTheme.of(context).fMenuThemeData;
    return Container(
      margin: EdgeInsets.only(left: position.dx, top: position.dy - button.size.height),
      child: MouseRegion(
        onEnter: (event) {
          print('onEnter');
        },
        onExit: (event) {
          print('onExit');
          cancelFunc();
        },
        child: Material(
          child: SizedBox(
            width: 180,
            child: ColoredBox(
              color: Colors.red,
              // color: menuThemeData.subMenuBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: widget.children,
              ),
            ),
          ),
        ),
      ),
    );
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
    return TextButton(
      onHover: (bool isHover) {
        if (isHover) {
          print('onHover~');
          BotToast.showWidget(
            toastBuilder: (cancelFunc) => buildHoverMenu(cancelFunc),
          );
        }
        // isHover = isHover;
        // setState(() {});
      },
      onPressed: () {},
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
            Transform.rotate(
              angle: -math.pi / 2,
              child: const Icon(
                Icons.expand_more,
                // color: Color(0xff909399),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
