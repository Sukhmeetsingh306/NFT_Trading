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
        width: 15,
        height: 15,
      ),
      const SizedBox(width: 6),
      googleText(
        text,
        // walletBalance.toStringAsFixed(2),
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    ],
  );
}

Widget earning(
  String text,
  String dailyIncome,
  String totalIncome, {
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        googleText(
          text,
          // walletBalance.toStringAsFixed(2),
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        const SizedBox(width: 6),
        Row(
          children: [
            Image.asset(
              'assets/images/t.png',
              width: 14,
              height: 14,
            ),
            const SizedBox(width: 4),
            googleText(
              dailyIncome,
              // walletBalance.toStringAsFixed(2),
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 4),
            Image.asset(
              'assets/images/t.png',
              width: 14,
              height: 14,
            ),
            const SizedBox(width: 4),
            googleText(
              totalIncome,
              // walletBalance.toStringAsFixed(2),
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ],
        ),
      ],
    ),
  );
}
