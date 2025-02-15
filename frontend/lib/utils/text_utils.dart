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
  FormFieldValidator<String> validator, {
  Widget? suffixIcon,
  TextInputType? keyboardType,
  Iterable<String>? autofillHints,
  void Function(String)? onChanged,
  bool? obscureText,
  AutovalidateMode? autovalidateMode,
}) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      autovalidateMode: autovalidateMode);
}

TextSpan textSpan(String text) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF9E9E9E),
    ),
  );
}


/*
code that will display the email 
Row(
                      children: [
                        Text(
                          '@', // Fixed '@' symbol
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        DropdownButton<String>(
                          value: selectedDomain,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedDomain = newValue;
                              });
                            }
                          },
                          items: emailDomains
                              .map<DropdownMenuItem<String>>((String domain) {
                            return DropdownMenuItem<String>(
                              value: domain,
                              child: Text(domain),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your email: ${_emailController.text.isNotEmpty ? _emailController.text : 'username'}@$selectedDomain',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
 */