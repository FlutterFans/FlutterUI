//
//  menu_demo
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_ui/flutter_ui.dart';

class MenuDemo extends StatelessWidget {
  const MenuDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FMenu(
      children: [
        FMenuItem(
          child: Text('FMenuItem1', style: TextStyle(color: Colors.red, fontSize: 19),),
        ),
        FMenuItem(
          child: Row(
            children: [
              Icon(Icons.access_alarm),
              Text('FMenuItem2'),
            ],
          ),
        ),
        FMenuGroup(
          groupTitle: 'GroupTitle',
          children: [
            FMenuItem(
              child: Text('FMenuItemGroup1'),
            ),
            FMenuItem(
              child: Text('FMenuItemGroup2'),
            ),
            FMenuGroup(
              groupTitle: 'GroupTitle1',
              children: [
                FMenuItem(
                  child: Text('FMenuItemGroup11'),
                ),
                FMenuItem(
                  child: Text('FMenuItemGroup21'),
                ),
              ],
            ),
          ],
        ),
        FSubMenu(
          children: [
            FMenuItem(
              child: Text('FSubMenuItem1'),
            ),
            FMenuItem(
              child: Text('FSubMenuItem2'),
            ),
            FSubMenu(children: [
              FMenuItem(
                child: Text('FSubSubMenuItem1'),
              ),
              FMenuItem(
                child: Text('FSubSubMenuItem2'),
              ),
            ])
          ],
        ),
      ],
    );
  }
}
