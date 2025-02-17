import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../text_utils.dart';

PreferredSizeWidget appBarCode() {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: googleText('DashBoard', fontSize: 20),
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

Widget endDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          child:
              Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Profile"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
      ],
    ),
  );
}
