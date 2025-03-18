import 'package:flutter/material.dart';

import '../fonts/text_fonts_utils.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          textSpan(
            'By logging, you agree to our',
          ),
          textSpan(
            ' Terms & Conditions',
          ),
          textSpan(
            ' and',
          ),
          textSpan(
            ' PrivacyPolicy.',
          ),
        ],
      ),
    );
  }
}
