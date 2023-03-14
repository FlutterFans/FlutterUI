import 'f_base_menu.dart';

/// 菜单组
class FMenuGroup extends FBaseMenu {
  final List<FBaseMenu> children;
  final String groupTitle;

  FMenuGroup({
    this.children = const [],
    this.groupTitle = '-',
  });

  @override
  bool operator ==(Object other) {
    if (other is! FMenuGroup) {
      return false;
    }
    if (groupTitle != other.groupTitle) {
      return false;
    }
    if (children.length != other.children.length) {
      return false;
    }
    for (int i = 0; i < children.length; i++) {
      if (children[i] != other.children[i]) {
        return false; //直接跳出并返回即可
      }
    }
    return true;
  }

  @override
  int get hashCode {children.hashCode
    return groupTitle.hashCode;
  }
}
