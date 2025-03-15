import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color/color_theme.dart';

Widget textFormField(
  TextEditingController controller,
  FocusNode focusNode,
  String labelText,
  String hintText,
  FormFieldValidator<String> validator, {
  Widget? suffixIcon,
  TextInputType? keyboardType,
  Iterable<String>? autofillHints,
  void Function(String)? onChanged,
  bool? obscureText,
  AutovalidateMode? autovalidateMode,
  List<TextInputFormatter>? inputFormatters,
}) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: GoogleFonts.getFont(
        'Inter',
        color: ColorTheme.color.textWhiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.getFont(
        'Inter',
        color: ColorTheme.color.textWhiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent, // Ensure transparent border
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true, // Ensure it's filled
      fillColor: Colors.black, // Set desired background color
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      suffixIcon: suffixIcon,
    ),
    style: GoogleFonts.getFont(
      'Inter',
      color: Colors.white, // Ensure text color is visible
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    keyboardType: keyboardType,
    autofillHints: autofillHints,
    validator: validator,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    autovalidateMode: autovalidateMode,
    inputFormatters: inputFormatters,
  );
}
