import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFE8F3FB),
            Color(0xFFE3F4F6),
            Color(0xFFDDF8F1),
            Color(0xFFD6FAEA),
            Color(0xFFDEF6E7),
            Color(0xFFF1EADE),
            Color(0xFFFDE3D6),
          ],
        ),
      ),
      child: child,
    );
  }
}
