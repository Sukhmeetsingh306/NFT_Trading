import 'package:flutter/material.dart';

import '../text_utils.dart';

Widget dashBoardOutlineButton(String text) {
  return SizedBox(
    width: 100,
    height: 30,
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(80, 30),
        side: const BorderSide(color: Colors.black),
      ),
      child: googleText(text, fontSize: 12),
    ),
  );
}
