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
          menuKey: 'FMenuItem1',
          child: Row(
            children: [
              Icon(Icons.access_alarm),
              Text('FMenuItem1'),
            ],
          ),
        ),
        FMenuItem(
          menuKey: 'FMenuItem2',
          child: Text('FMenuItem2'),
        ),
        FSubMenu(
          subMenuTitle: 'FSubSubMenu1',
          children: [
            FMenuGroup(
              groupTitle: 'GroupTitle',
              children: [
                FMenuItem(
                  menuKey: 'FMenuItemGroup1',
                  child: Text('FMenuItemGroup1'),
                ),
                FMenuItem(
                  menuKey: 'FMenuItemGroup2',
                  child: Text('FMenuItemGroup2'),
                ),
                FMenuGroup(
                  groupTitle: 'GroupTitle1',
                  children: [
                    FMenuItem(
                      menuKey: 'FMenuItemGroup11',
                      child: Text('FMenuItemGroup11'),
                    ),
                    FMenuItem(
                      menuKey: 'FMenuItemGroup21',
                      child: Text('FMenuItemGroup21'),
                    ),
                    FSubMenu(
                      subMenuTitle: 'FSubSubMenu21',
                      children: [
                        FMenuItem(
                          menuKey: 'FSubSubMenuItem1222',
                          child: Text('FSubSubMenuItem1222'),
                        ),
                        FMenuItem(
                          menuKey: 'FSubSubMenuItem2111',
                          child: Text('FSubSubMenuItem2111'),
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
          subMenuTitle: 'FSubSubMenu1',
          children: [
            FMenuItem(
              menuKey: 'FSubMenuItem1',
              child: Text('FSubMenuItem1'),
            ),
            FMenuItem(
              menuKey: 'FSubMenuItem2',
              child: Text('FSubMenuItem2'),
            ),
            FSubMenu(
              subMenuTitle: 'FSubSubMenu2',
              children: [
                FMenuItem(
                  menuKey: 'FSubSubMenuItem1',
                  child: Text('FSubSubMenuItem1'),
                ),
                FMenuItem(
                  menuKey: 'FSubSubMenuItem2',
                  child: Text('FSubSubMenuItem2'),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
