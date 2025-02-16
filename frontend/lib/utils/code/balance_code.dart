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

Widget earning(
  String text,
  String dailyIncome,
  String totalIncome, {
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Row(
    children: [
      googleText(
        text,
        // walletBalance.toStringAsFixed(2),
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      const SizedBox(width: 6),
      Image.asset(
        'assets/images/t.png',
        width: 17,
        height: 17,
      ),
      const SizedBox(width: 6),
      googleText(
        dailyIncome,
        // walletBalance.toStringAsFixed(2),
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      const SizedBox(width: 6),
      Image.asset(
        'assets/images/t.png',
        width: 17,
        height: 17,
      ),
      const SizedBox(width: 6),
      googleText(
        totalIncome,
        // walletBalance.toStringAsFixed(2),
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    ],
  );
}
