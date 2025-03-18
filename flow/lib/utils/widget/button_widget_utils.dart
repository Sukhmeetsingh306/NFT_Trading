import 'package:flutter/material.dart';

import '../fonts/google_fonts_utils.dart';
import '../theme/color/color_theme.dart';

ElevatedButton elevatedButton(
  String buttonText,
  VoidCallback onPressed,
) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        ColorTheme.color.buttonBackgroundColor,
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    onPressed: onPressed,
    child: googleInterText(
      buttonText,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}
