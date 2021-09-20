import 'package:flutter/material.dart';

class FMenuThemeDataDark extends FMenuThemeData {
  const FMenuThemeDataDark({
    Color normalColor = Colors.black,
    Color selectedColor = Colors.red,
  }) : super(
          normalColor: normalColor,
          selectedColor: selectedColor,
        );
}

class FMenuThemeData {
  final Color normalColor;
  final Color selectedColor;

  const FMenuThemeData({
    this.normalColor = Colors.green,
    this.selectedColor = Colors.blue,
  });

  FMenuThemeData copyWith({
    Color? normalColor,
    Color? selectedColor,
  }) {
    return FMenuThemeData(
      normalColor: normalColor ?? this.normalColor,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is FMenuThemeData && other.normalColor == normalColor;
  }

  @override
  int get hashCode {
    return hashValues(
      normalColor,
      selectedColor,
    );
  }
}
