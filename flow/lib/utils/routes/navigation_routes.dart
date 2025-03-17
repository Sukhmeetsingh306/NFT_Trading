import 'package:flutter/material.dart';

Future<void> pageRouteNavigator(BuildContext context, Widget classname) {
  return Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, index, _) => classname,
      //Try(),
      opaque: false,
    ),
  );
}

Future<void> pageRouteNavigatorRep(BuildContext context, Widget classname) {
  return Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, index, _) => classname,
      //Try(),
      opaque: false,
    ),
  );
}

Future<void> materialRouteNavigator(BuildContext context, Widget classname) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => classname,
    ),
  );
}

Future<void> materialRouteNavigatorRep(BuildContext context, Widget classname) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => classname,
    ),
  );
}

Future<void> pushAndRemoveUntil(BuildContext context, Widget classname) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => classname,
    ),
    (Route<dynamic> route) => false, // Remove all previous routes
  );
}

void pop(BuildContext context) {
  return Navigator.of(context).pop();
}
