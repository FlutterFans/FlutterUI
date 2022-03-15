import 'f_base_menu.dart';

/// 菜单组
class FMenuGroup extends FBaseMenu {
  final List<FBaseMenu> children;
  final String groupTitle;
  FMenuGroup({
    this.children = const [],
    this.groupTitle = '-',
  });
}
