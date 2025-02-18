import 'package:flutter/material.dart';

GestureDetector gestureDetectorRich(Widget child, {GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: child,
  );
}
