import 'package:flutter/material.dart';

@immutable
class ColorThemeData {
  final whiteColor = const Color(0xffFFFFFF);
  final lustRedColor = const Color(0xffE11717);
  final transparentBack = Colors.transparent;
  final backgroundBlack = const Color.fromRGBO(15, 15, 14, 0.5);
  final deepPuceColor = const Color(0xffAC5F5F);
  final blackColor = const Color(0xff000000);
  final primaryBackground = const Color(0x00182026);

  const ColorThemeData();
}

// import 'package:flutter/material.dart';

// final colorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 102, 6, 247),
//   background: const Color.fromARGB(255, 255, 255, 255),
//   error: const Color.fromRGBO(225, 23, 23, 1),
// )
