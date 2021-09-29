//
//  menu_slide_panel
//  flutter_ui
//
//  Created by yukai on 2021/9/29.
//  Copyright ©2021/9/29 flutter_ui. All Rights Reserved.
//
import 'package:flutter/material.dart';

class MenuSlidePanel extends StatefulWidget {
  const MenuSlidePanel({
    Key? key,
    required this.child,
    this.isMenuOpen = false,
  }) : super(key: key);
  final Widget child;
  final bool isMenuOpen;

  @override
  _SlidePanelState createState() => _SlidePanelState();
}

class _SlidePanelState extends State<MenuSlidePanel> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    if (widget.isMenuOpen) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant MenuSlidePanel oldWidget) {
    if (widget.isMenuOpen != oldWidget.isMenuOpen) {
      if (widget.isMenuOpen) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.isDismissed && !widget.isMenuOpen) {
      return const SizedBox();
    }
    return SizeTransition(
      sizeFactor: Tween<double>(begin: 0, end: 1).animate(controller),
      child: widget.child,
    );
  }
}
