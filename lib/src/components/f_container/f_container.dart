import 'package:flutter/widgets.dart';

import '../base_widget.dart';

class FContainer extends BaseWidget {
  final Axis axis;
  final List<Widget> children;

  const FContainer({
    Key? key,
    this.axis = Axis.vertical,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> target = [];
    target.addAll(children);
    final len = children.length;
    for (var i = 0; i < len; i++) {
      if (target[i] is FContainer) {
        target[i] = Expanded(child: target[i]);
      }
    }
    return Flex(
      direction: axis,
      children: target,
      mainAxisSize: MainAxisSize.max,
    );
  }
}

abstract class FLayout extends BaseWidget {
  final double height;
  final double width;
  final Widget? child;
  final Color? color;
  const FLayout({
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content = SizedBox(height: height, width: width, child: child);
    if (color != null) {
      content = ColoredBox(
        color: color!,
        child: content,
      );
    }
    if (width == double.infinity && height == double.infinity) {
      content = Expanded(child: content);
    }
    return content;
  }
}

class FHeader extends FLayout {
  const FHeader({
    Key? key,
    double height = 60.0,
    double width = double.infinity,
    Widget? child,
    Color? color,
  }) : super(
          key: key,
          height: height,
          width: width,
          child: child,
          color: color,
        );
}

class FAside extends FLayout {
  const FAside({
    Key? key,
    double height = double.infinity,
    double width = 300,
    Widget? child,
    Color? color,
  }) : super(
          key: key,
          height: height,
          width: width,
          child: child,
          color: color,
        );
}

class FMain extends FLayout {
  const FMain({
    Key? key,
    double height = double.infinity,
    double width = double.infinity,
    Widget? child,
    Color? color,
  }) : super(
          key: key,
          height: height,
          width: width,
          child: child,
          color: color,
        );
}

class FFooter extends FLayout {
  const FFooter({
    Key? key,
    double height = 60,
    double width = double.infinity,
    Widget? child,
    Color? color,
  }) : super(
          key: key,
          height: height,
          width: width,
          child: child,
          color: color,
        );
}
