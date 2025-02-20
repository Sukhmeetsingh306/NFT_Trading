import 'package:flutter/material.dart';
import 'package:frontend/screens/account/dashboard_account.dart';
import 'package:frontend/screens/account/reserve_account.dart';
import 'package:frontend/screens/history_screen.dart';
import 'package:frontend/utils/navigation_utils.dart';

import '../text_utils.dart';

Widget floatingRowCode(BuildContext context) {
  return Positioned(
    bottom: MediaQuery.of(context).size.height * .065,
    left: 10,
    right: 10,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2), // Fixed error
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _customButton(
            "Earn",
            onPressed: () {
              if (!isCurrentRoute(context, ReserveAccount())) {
                pageRouteNavigator(context, ReserveAccount());
              }
            },
          ),
          _separator(),
          _customButton(
            "Rewards",
            onPressed: () {
              if (!isCurrentRoute(context, ReserveAccount())) {
                materialRouteNavigator(context, ReserveAccount());
              }
            },
          ),
          _separator(),
          _customButton(
            "History",
            onPressed: () {
              if (!isCurrentRoute(context, HistoryScreen())) {
                pageRouteNavigatorRep(context, HistoryScreen());
              }
            },
          ),
          _separator(),
          _customButton(
            "Profile",
            onPressed: () {
              if (!isCurrentRoute(context, DashboardAccount())) {
                pageRouteNavigatorRep(context, DashboardAccount());
              }
            },
          ),
        ],
      ),
    ),
  );
}

bool isCurrentRoute(BuildContext context, Widget targetPage) {
  return ModalRoute.of(context)?.settings.name ==
      targetPage.runtimeType.toString();
}

Widget _customButton(String text, {GestureTapCallback? onPressed}) {
  return Expanded(
    child: TextButton(
      onPressed: onPressed,
      child: googleText(text, fontSize: 14, fontWeight: FontWeight.normal),
    ),
  );
}

Widget _separator() {
  return Text(
    "|",
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey),
  );
}
