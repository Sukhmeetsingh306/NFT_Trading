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

Widget containerWhite(Widget child) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: child,
      ),
    ),
  );
}
