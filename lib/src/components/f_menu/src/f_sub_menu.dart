import 'f_base_menu.dart';

class FSubMenu extends FBaseMenu {
  final List<FBaseMenu> children;
  final String subMenuTitle;

  FSubMenu({
    required this.children,
    required this.subMenuTitle,
  });
}
