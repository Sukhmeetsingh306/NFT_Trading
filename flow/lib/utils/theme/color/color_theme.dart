import 'package:flutter/material.dart';

import 'color_data_theme.dart';

@immutable
class ColorTheme {
  static const color = ColorThemeData();

  const ColorTheme();

  static ThemeData define() {
    return ThemeData(primaryColor: Colors.purple);
  }
}
