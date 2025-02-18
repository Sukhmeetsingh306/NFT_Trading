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
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    ],
  );
}

Widget earning(
  BuildContext context,
  String text,
  String dailyIncome,
  String totalIncome, {
  double? fontSize,
  FontWeight? fontWeight,
}) {
  double width = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.only(right: 8.0, top: 4, bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.3,
          child: googleText(
            text,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
        SizedBox(
          width: width * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              Image.asset(
                'assets/images/t.png',
                width: 14,
                height: 14,
              ),
              const SizedBox(width: 4),
              googleText(
                dailyIncome,
                fontSize: fontSize ?? 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              Image.asset(
                'assets/images/t.png',
                width: 14,
                height: 14,
              ),
              const SizedBox(width: 4),
              googleText(
                totalIncome,
                fontSize: fontSize ?? 14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Text teamText(
  String text, {
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return googleText(
    text,
    fontSize: fontSize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    textAlign: TextAlign.center,
  );
}
