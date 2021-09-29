import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui/src/components/f_menu/src/f_base_menu.dart';

import '../../base_widget.dart';
import 'f_menu_constants.dart';

class FMenuItem extends BaseWidget with FBaseMenu {
  final Widget child;
  /// 菜单的唯一标识
  final dynamic menuKey;

  const FMenuItem({
    Key? key,
    required this.child,
    required this.menuKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fMenuItemHeight,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
