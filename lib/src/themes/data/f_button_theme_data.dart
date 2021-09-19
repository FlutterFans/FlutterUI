import 'package:flutter/material.dart';

class FButtonThemeData {
  final Color normalColor;
  final Color selectedColor;

  FButtonThemeData({
    this.normalColor = Colors.green,
    this.selectedColor = Colors.blue,
  });

  FButtonThemeData copyWith({
    Color? normalColor,
    Color? selectedColor,
  }) {
    return FButtonThemeData(
      normalColor: normalColor ?? this.normalColor,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is FButtonThemeData && other.normalColor == normalColor;
  }

  @override
  int get hashCode {
    return hashValues(
      normalColor,
      selectedColor,
    );
  }
}
