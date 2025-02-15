import 'package:flutter/material.dart';

import '../text_utils.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final VoidCallback onPressed;
  final double? fontSize;

  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHeight,
      this.fontSize,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 16,
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? const Color.fromRGBO(36, 124, 255, 1),
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 12,
            vertical: verticalPadding ?? 14,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 52),
        ),
      ),
      child: googleText(
        buttonText,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
