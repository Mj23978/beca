import 'package:flutter/material.dart';

class JsonHelpers {
  static Color colorFromInt(int colorValue) => Color(colorValue);

  static int colorToInt(Color color) => color.value;

  static IconData iconFromInt(int codePoint) => IconData(codePoint);

  static int iconToInt(IconData icon) => icon.codePoint;
}
