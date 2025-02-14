import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text googleText(String text,
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return Text(
    text,
    style: GoogleFonts.getFont(
      'Lato',
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      letterSpacing: 0.2,
      fontSize: fontSize ?? 23, // Defaults to 23 if fontSize is null
    ),
  );
}

Widget textFormField(
  TextEditingController controller,
  String labelText,
  FormFieldValidator<String> validator,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    validator: validator,
  );
}
