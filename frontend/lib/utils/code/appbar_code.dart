import 'package:flutter/material.dart';
import 'package:frontend/core/background_core.dart';
import 'package:frontend/screens/account/reserve_account.dart';
import 'package:frontend/utils/navigation_utils.dart';
import '../../screens/account/dashboard_account.dart';
import '../../screens/login_screen.dart';
import '../text_utils.dart';

PreferredSizeWidget appBarCode(String screenName) {
  return AppBar(
    backgroundColor: Color(0xFFE7F1F3),
    elevation: 4,
    //e7f1f3
    title: Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: googleText(screenName, fontSize: 20),
    ),
    actions: [
      // IconButton(
      //   icon: const Icon(LucideIcons.bell),
      //   onPressed: () {
      //     // Add notification action
      //   },
      // ),
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
        SizedBox(
          height: MediaQuery.of(context).size.height * .16,
          child: DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: backgroundColor,
              ),
            ),
            child: googleText("Menu", color: Colors.black, fontSize: 24),
          ),
        ),
        listTile(
          "Home",
          Icon(Icons.home),
        ),
        listTile(
          "Profile",
          Icon(Icons.account_circle),
          onTap: () {
            pageRouteNavigatorRep(
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
        listTile("Logout", Icon(Icons.logout_rounded), onTap: () {
          pushAndRemoveUntil(
            context,
            const LoginScreen(),
          );
        }),
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
