import 'package:flutter/material.dart';
import '../text_utils.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final List<Color>? gradientColors; // Accepts gradient colors
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final VoidCallback onPressed;
  final double? fontSize;
  final Color? color;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.gradientColors,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.color,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? double.maxFinite,
      height: buttonHeight ?? 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: gradientColors == null
            ? const Color.fromRGBO(36, 124, 255, 1)
            : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12,
              vertical: verticalPadding ?? 14,
            ),
          ),
        ),
        child: googleText(
          buttonText,
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w600,
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
