import 'package:flutter/widgets.dart';
import 'package:flutter_ui/flutter_ui.dart';

import 'f_base_menu.dart';

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
  List<Widget> _handleInlineChildren(
    List<FBaseMenu> children,
    double menuItemPadding,
  ) {
    List<Widget> newItems = [];
    for (var item in children) {
      if (item is FMenuItem) {
        newItems.add(
          Container(
            color: Color(0xffff00ff),
            padding: EdgeInsets.only(
              left: menuItemPadding,
              right: FDimens.fMenuPaddingRight,
            ),
            child: item,
          ),
        );
      } else if (item is FMenuGroup) {
        newItems.add(Container(
          padding: EdgeInsets.only(
            left: menuItemPadding + FDimens.fMenuGroupPaddingLeft,
          ),
          child: Text(
            item.groupTitle,
            style: const TextStyle(
              color: Color(0x73000000),
              fontSize: 14,
            ),
          ),
        ));
        newItems.addAll(_handleInlineChildren(
          item.children,
          menuItemPadding + FDimens.fMenuPaddingLeft,
        ));
      } else if (item is FSubMenu) {
        newItems.addAll(_handleInlineChildren(
          item.children,
          menuItemPadding + FDimens.fMenuPaddingLeft,
        ));
      }
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox();
    if (widget.mode == FMenuMode.horizontal) {
      // content = Row(
      //   children: widget.children,
      // );
    } else {
      double initPadding = FDimens.fMenuPaddingLeft;
      final newWidgets = _handleInlineChildren(widget.children, initPadding);
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: newWidgets,
      );
    }
    return Container(
      width: double.infinity,
      color: Color(0xffcccccc),
      child: content,
    );
  }
}
