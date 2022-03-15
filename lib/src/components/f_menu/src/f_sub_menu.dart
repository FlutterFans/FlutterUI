import 'package:flutter/widgets.dart';

import 'f_base_menu.dart';

//子菜单容器
class FSubMenu extends FBaseMenu {
  final List<FBaseMenu> children;
  final String subMenuTitle;
  final Widget? icon;
  final bool isExpanded;

  FSubMenu({
    required this.children,
    required this.subMenuTitle,
    this.icon,
    this.isExpanded = false,
  });
}
