import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';
import 'package:flutter_ui/utils/ui_styles.dart';

import 'f_base_menu.dart';

const double fMenuPaddingLeft = 24;
const double fMenuPaddingRight = 16;
const double fMenuGroupPaddingLeft = 8;

enum FMenuMode { vertical, horizontal, inline }

class FMenu extends StatefulWidget {
  final List<FBaseMenu> children;
  final FMenuMode mode;

  const FMenu({
    Key? key,
    required this.children,
    this.mode = FMenuMode.inline,
  }) : super(key: key);

  @override
  State<FMenu> createState() => _FMenuState();
}

class _FMenuState extends State<FMenu> {
  List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
  }

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
        newItems.add(TextButton(
          onHover: (bool isHover) {},
          onPressed: () {
            node.requestFocus();
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
          menuItemPadding + fMenuPaddingLeft,
          menuThemeData,
        ));
      } else if (item is FSubMenu) {
        newItems.addAll(_handleInlineChildren(
          item.children,
          menuItemPadding + fMenuPaddingLeft,
          menuThemeData,
        ));
      }
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    final menuThemeData = AppTheme.of(context).fMenuThemeData;
    Widget content = SizedBox();
    if (widget.mode == FMenuMode.horizontal) {
      // content = Row(
      //   children: widget.children,
      // );
    } else {
      double initPadding = fMenuPaddingLeft;
      focusNodes.clear();
      final newWidgets = _handleInlineChildren(widget.children, initPadding, menuThemeData);
      content = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: newWidgets,
        ),
      );
    }
    return Container(
      width: double.infinity,
      color: menuThemeData.menuBackgroundColor,
      child: content,
    );
  }
}
