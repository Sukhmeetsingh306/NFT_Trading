import 'package:flutter/material.dart';

import '../text_utils.dart';

Widget income(
  String text, {
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Row(
    children: [
      Image.asset(
        'assets/images/t.png',
        width: 17,
        height: 17,
      ),
      const SizedBox(width: 6),
      googleText(
        text,
        // walletBalance.toStringAsFixed(2),
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    ],
  );
}
