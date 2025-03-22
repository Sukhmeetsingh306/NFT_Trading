import 'package:flutter/material.dart';

import '../fonts/google_fonts_utils.dart';
import '../theme/color/color_theme.dart';

Widget containerDash(
    BuildContext context, String title, String income, Color color) {
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.44,
    decoration: BoxDecoration(
      color: ColorTheme.color.secondaryBackgroundColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Color(0x3F14181B),
          offset: Offset(
            0.0,
            3,
          ),
        )
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          googleInterTextWeight4Font16(title, fontSize: 12),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
            child: googleInterTextWeight4Font16(
              income,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: ColorTheme.color.tertiaryColor,
            ),
          ),
          Container(
            width: 80,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0x4D39D2C0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                googleInterTextWeight4Font16(
                  '4.5%',
                  fontSize: 14,
                  color: color,
                ),
                Icon(
                  Icons.trending_up_rounded,
                  color: color,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget containerField(
  Widget child, {
  double? width,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: ColorTheme.color.alternativeColor),
      color: ColorTheme.color.secondaryBackgroundColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 8,
          offset: Offset(0, 2),
        )
      ],
    ),
    child: child,
  );
}
