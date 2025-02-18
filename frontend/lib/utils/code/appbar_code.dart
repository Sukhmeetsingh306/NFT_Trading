import 'package:flutter/material.dart';
import 'package:frontend/core/background_core.dart';
import 'package:frontend/screens/account/reserve_account.dart';
import 'package:frontend/utils/navigation_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../screens/account/dashboard_account.dart';
import '../text_utils.dart';

PreferredSizeWidget appBarCode(String screenName) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: googleText(screenName, fontSize: 20),
    ),
    actions: [
      IconButton(
        icon: const Icon(LucideIcons.bell),
        onPressed: () {
          // Add notification action
        },
      ),
      Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ),
    ],
  );
}

Widget endDrawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width * .5,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: backgroundColor,
            ),
          ),
          child: googleText("Menu", color: Colors.black, fontSize: 24),
        ),
        listTile(
          "Home",
          Icon(Icons.home),
        ),
        listTile(
          "Profile",
          Icon(Icons.account_circle),
          onTap: () {
            pushAndRemoveUntil(
              context,
              const DashboardAccount(),
            );
          },
        ),
        listTile(
          "Settings",
          Icon(Icons.settings),
        ),
        listTile(
          "Earn",
          Image.asset('assets/icons/nft_list.png', width: 24, height: 24),
          onTap: () {
            pop(context);
            materialRouteNavigator(
              context,
              const ReserveAccount(),
            );
          },
        ),
      ],
    ),
  );
}

ListTile listTile(String text, Widget leading, {GestureTapCallback? onTap}) {
  return ListTile(
    leading: leading,
    title: googleText(text, fontSize: 16, fontWeight: FontWeight.normal),
    onTap: onTap ?? () {},
  );
}
