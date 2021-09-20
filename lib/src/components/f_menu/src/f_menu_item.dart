import 'package:flutter/widgets.dart';
import 'package:flutter_ui/src/components/f_menu/src/f_base_menu.dart';

import '../../base_widget.dart';

class FMenuItem extends BaseWidget with FBaseMenu {
  final Widget child;
  const FMenuItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      color: Color(0xfffaff33),
      child: child,
    );
  }
}
