import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color/color_theme.dart';

TextSpan textSpan(
  String text, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextSpan(
    text: text,
    style: GoogleFonts.getFont(
      'Inter',
      color: color ?? ColorTheme.color.textWhiteColor,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 23,
    ),
  );
}
