import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasMinLength;
  const PasswordValidations({super.key, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Column(
        children: [
          buildValidationRow('At least 1 lowercase letter', hasMinLength),
          buildValidationRow('At least 1 uppercase letter', hasMinLength),
          buildValidationRow('At least 1 special character', hasMinLength),
          buildValidationRow('At least 1 number', hasMinLength),
          buildValidationRow('At least 8 characters', hasMinLength),
        ],
      ),
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: GoogleFonts.getFont('Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 255, 255, 255))
              .copyWith(
                  decoration: hasValidated ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.green,
                  decorationThickness: 2,
                  color: hasValidated
                      ? const Color.fromARGB(255, 252, 252, 252)
                      : const Color.fromARGB(255, 255, 255, 255)),
        )
      ],
    );
  }
}
