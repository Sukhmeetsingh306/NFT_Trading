import 'package:flutter/material.dart';
import 'package:frontend/utils/buttons/dashboard_buttons.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/text_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../core/background_core.dart';

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
      body: SafeArea(
        child: Background(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 18),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage(
                      //     'assets/profile.jpg'),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Username",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(height: 5),
                        Text(
                          "UID: 123456",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today,
                          size: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dashBoardOutlineButton('Level 1  >'),
                    const SizedBox(width: 15),
                    dashBoardOutlineButton('20 Points  >'),
                  ],
                ),
              ),
              sizedBoxH10(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        googleText(
                          'Wallet Balance',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        sizedBoxH8(),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            googleText(
                              'Daily Income',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            googleText(
                              'Total Income',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
