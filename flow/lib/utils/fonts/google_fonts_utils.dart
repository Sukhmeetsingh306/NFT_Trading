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
      'Inter',
      color: color ?? ColorTheme.color.textWhiteColor,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 23,
    ),
  );
}

Text googleInterTextWeight4Font16(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.getFont(
      'Inter',
      color: color ?? ColorTheme.color.textWhiteColor,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 16,
    ),
  );
}

Text googleInterTextWeight4Font12(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.getFont(
      'Inter',
      color: color ?? ColorTheme.color.textWhiteColor,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 12,
    ),
  );
}

Text googleInterTextWeight4Font14(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.getFont(
      'Inter',
      color: color ?? ColorTheme.color.textWhiteColor,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 14,
    ),
  );
}

Text googleInterTextWeight4Font14ColorGrey(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.getFont(
      'Inter',
      color: color ?? Colors.grey,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 14,
    ),
  );
}

Text googleReadexProText(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.getFont(
      'Readex Pro',
      color: color ?? ColorTheme.color.textWhiteColor,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 0.1,
      fontSize: fontSize ?? 23,
    ),
  );
}
