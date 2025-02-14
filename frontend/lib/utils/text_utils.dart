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