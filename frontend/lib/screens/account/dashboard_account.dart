import 'package:flutter/material.dart';
import 'package:frontend/utils/text_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardAccount extends StatelessWidget {
  const DashboardAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft, // Colors applied in columns
            end: Alignment.centerRight,
            colors: [
              Color(0xFFE8F3FB),
              Color(0xFFE3F4F6), // Dark Blue (Left Column)
              Color(0xFFDDF8F1), // Deep Navy
              Color(0xFFD6FAEA),
              Color(0xFFDEF6E7), // Electric Blue
              Color(0xFFF1EADE),
              Color(0xFFFDE3D6), // Hot Pink (Right Column)
            ],
          ),
        ),
      ),
    );
  }
}
