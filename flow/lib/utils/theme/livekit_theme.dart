import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


extension LKColors on Colors {
  static const lkBlue = Color(0xFF5A8BFF);
  static const lkDarkBlue = Color(0xFF00153C);
}

class LiveKitTheme {
  //
  final bgColor = Colors.black;
  final textColor = Colors.white;
  final cardColor = LKColors.lkDarkBlue;
  final accentColor = LKColors.lkBlue;

  ThemeData buildThemeData(BuildContext ctx) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: cardColor,
        ),
        cardColor: cardColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
          
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 20, horizontal: 25)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // backgroundColor: MaterialStateProperty.all<Color>(accentColor),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return accentColor.withOpacity(0.5);
              }
              return accentColor;
            }),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(accentColor),
        ),
        // switchTheme: SwitchThemeData(
        //   trackColor: MaterialStateProperty.resolveWith((states) {
        //     print('states: $states');
        //     if (states.contains(MaterialState.disabled)) {
        //       return Colors.red;
        //     }
        //     return accentColor;
        //   }),
        // ),
        dialogTheme: DialogTheme(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        
        hintColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: LKColors.lkBlue,
          ),
          hintStyle: TextStyle(
            color: LKColors.lkBlue.withOpacity(.5),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ), //colorScheme: ColorScheme(background: bgColor),
      );
}
