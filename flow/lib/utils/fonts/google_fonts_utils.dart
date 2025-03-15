import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color/color_theme.dart';

Text googleInterText(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.getFont(
      'Lato',
      color: color ?? ColorTheme.color.textWHiteColor,
      fontWeight: fontWeight ?? FontWeight.bold,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 23,
    ),
  );
}
