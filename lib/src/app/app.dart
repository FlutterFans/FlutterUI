//
//  aa
//  flutter_ui
//
//  Created by yukai on 2021/10/12.
//  Copyright ©2021/10/12 flutter_ui. All Rights Reserved.
//

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TransitionBuilder OverLayerBuilder() {
  return BotToastInit();
}

// ignore: non_constant_identifier_names
NavigatorObserver OverLayerObserver() {
  return BotToastNavigatorObserver();
}