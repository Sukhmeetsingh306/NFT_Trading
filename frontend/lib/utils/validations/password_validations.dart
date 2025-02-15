import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasMinLength;
  const PasswordValidations({super.key, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return buildValidationRow('At least 8 characters', hasMinLength);
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: Color.fromRGBO(117, 117, 117, 1),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: GoogleFonts.getFont('Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF757575))
              .copyWith(
                  decoration: hasValidated ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.green,
                  decorationThickness: 2,
                  color: hasValidated
                      ? const Color(0xFF757575)
                      : const Color(0xFF242424)),
        )
      ],
    );
  }
}
