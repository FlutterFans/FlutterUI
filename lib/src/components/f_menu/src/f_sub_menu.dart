import 'package:flutter/widgets.dart';

import 'f_base_menu.dart';

class FSubMenu extends FBaseMenu {
  final List<FBaseMenu> children;
  final String subMenuTitle;
  final Widget? icon;

  FSubMenu({
    required this.children,
    required this.subMenuTitle,
    this.icon
  });
}
