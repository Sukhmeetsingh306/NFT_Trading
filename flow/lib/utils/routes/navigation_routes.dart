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

Future<void> pageNamedRouteNavigator(BuildContext context, String routeName) {
  return Navigator.pushNamed(context, routeName);
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

Future<void> pageNamedRouteNavigatorRep(
    BuildContext context, String routeName) {
  return Navigator.pushReplacementNamed(context, routeName);
}

Future<void> materialRouteNavigator(BuildContext context, Widget classname) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => classname,
    ),
  );
}

Future<void> materialNamedRouteNavigator(BuildContext context, String routeName,
    {Object? argument}) {
  return Navigator.pushNamed(context, routeName, arguments: argument);
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

Future<void> pushNamedAndRemoveUntil(BuildContext context, String routeName) {
  return Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (Route<dynamic> route) => false,
  );
}

void pop(BuildContext context) {
  return Navigator.of(context).pop();
}
