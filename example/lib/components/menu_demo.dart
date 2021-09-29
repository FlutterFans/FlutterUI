//
//  menu_demo
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';

class MenuDemo extends StatelessWidget {
  const MenuDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FMenu(
      onMenuClick: (menuKey) {
        if (kDebugMode) {
          print(menuKey);
        }
      },
      children: [
        FMenuItem(
          menuKey: 'FSubMenuItem2',
          child: Text('Option Single 1'),
        ),
        FMenuItem(
          menuKey: 'FSubMenuItem2',
          child: Text('Option Single 2'),
        ),
        FSubMenu(
          subMenuTitle: 'Navigator One',
          children: [
            FMenuGroup(
              groupTitle: 'Group One',
              children: [
                FMenuItem(
                  menuKey: 'item1',
                  child: Text('item one'),
                ),
                FMenuItem(
                  menuKey: 'item2',
                  child: Text('item Two'),
                ),
                FMenuGroup(
                  groupTitle: 'Group Two',
                  children: [
                    FMenuItem(
                      menuKey: 'FMenuItemGroup11',
                      child: Text('item three'),
                    ),
                    FSubMenu(
                      subMenuTitle: 'item four',
                      children: [
                        FMenuItem(
                          menuKey: 'FSubSubMenuItem1222',
                          child: Text('item one'),
                        ),
                        FMenuItem(
                          menuKey: 'FSubSubMenuItem2111',
                          child: Text('item two'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        FSubMenu(
          subMenuTitle: 'Navigation Two',
          children: [
            FMenuItem(
              menuKey: 'FSubMenuItem1',
              child: Text('Option 5'),
            ),
            FMenuItem(
              menuKey: 'FSubMenuItem2',
              child: Text('Option 6'),
            ),
            FSubMenu(
              subMenuTitle: 'Submenu',
              children: [
                FMenuItem(
                  menuKey: 'FSubSubMenuItem1',
                  child: Text('Option 7'),
                ),
                FMenuItem(
                  menuKey: 'FSubSubMenuItem2',
                  child: Text('Option 8'),
                ),
              ],
            )
          ],
        ),
        FMenuItem(
          menuKey: 'FSubMenuItem2',
          child: Text('Option Single 3'),
        ),
        FSubMenu(
          subMenuTitle: 'Navigation Three',
          children: [
            FMenuItem(
              menuKey: 'FSubMenuItem1',
              child: Text('Option 5'),
            ),
            FMenuItem(
              menuKey: 'FSubMenuItem2',
              child: Text('Option 6'),
            ),
          ],
        ),
      ],
    );
  }
}
