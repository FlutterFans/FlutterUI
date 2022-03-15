import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';

import '_inner/inline/inline_menu_handler.dart';
import '_inner/vertical/vertical_menu_handler.dart';
import 'f_base_menu.dart';

enum FMenuMode { vertical, horizontal, inline }

typedef MenuClick = Function(dynamic menuKey);

class FMenu extends StatefulWidget {
  final List<FBaseMenu> children;
  final FMenuMode mode;
  final MenuClick onMenuClick;
  final List<dynamic>? selectedMenuKeys;

  const FMenu({
    Key? key,
    required this.children,
    required this.onMenuClick,
    this.selectedMenuKeys,
    this.mode = FMenuMode.inline,
  }) : super(key: key);

  @override
  State<FMenu> createState() => _FMenuState();
}

class _FMenuState extends State<FMenu> {
  late AppTheme appTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = AppTheme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final menuThemeData = appTheme.fMenuThemeData;
    Widget content;
    if (widget.mode == FMenuMode.horizontal) {
      content = Row(
        // children: widget.children,
      );
    } else if (widget.mode == FMenuMode.inline) {
      final newWidgets = InlineMenuHandler.createInlineMenu(
        children: widget.children,
        appTheme: appTheme,
        onMenuClick: widget.onMenuClick,
        selectedMenuKeys: widget.selectedMenuKeys,
      );
      content = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: newWidgets,
        ),
      );
    } else {
      final newWidgets = VerticalMenuHandler.createVerticalMenu(
        widget.children,
        appTheme,
        widget.onMenuClick,
      );
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
