import 'package:flutter/material.dart';
import 'package:frontend/utils/buttons/dashboard_buttons.dart';
import 'package:frontend/utils/code/balance_code.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/text_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../core/background_core.dart';

class DashboardAccount extends StatelessWidget {
  const DashboardAccount({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                      //   'assets/images/t.png',
                      // ),
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
              containerWhite(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    googleText(
                      'Wallet Balance',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    sizedBoxH8(),
                    income(
                      '100.00',
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: width * 0.38),
                          googleText(
                            'Daily Income',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: width * 0.03),
                          googleText(
                            'Total Income',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    earning(context, 'Comprehensive', '100', '100'),
                    earning(context, 'Reserve', '0', '90000'),
                    earning(context, 'Team', '50000', '0'),
                    earning(context, 'Activity', '0', '0'),
                    earning(context, 'Stake', '0', '0'),
                  ],
                ),
              ),
              sizedBoxH8(),
              containerWhite(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    googleText(
                      'Wallet Balance',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Divider(),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            teamColumn('0', 'Community\n rewards'),
                            teamColumn('0', 'Valid\n Members'),
                            teamColumn('0', 'A enthusiast\n  '),
                            teamColumn('0', 'B+C\n enthusiasts'),
                          ],
                        ),
                        sizedBoxH15(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            teamColumnImage(
                              'assets/icons/community.png',
                              'Community\nenthusiasts',
                            ),
                            teamColumnImage(
                              'assets/icons/trophy.png',
                              'Community\ncontributions',
                            ),
                            teamColumnImage(
                              'assets/icons/orders.png',
                              'Community\norders',
                            ),
                            teamColumnImage(
                              'assets/icons/share.png',
                              'Referral\n ',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget teamColumn(String amount, String name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      teamText(amount, fontWeight: FontWeight.bold),
      SizedBox(width: 8),
      teamText(name),
    ],
  );
}

Widget teamColumnImage(String image, String name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ImageIcon(
        AssetImage(image),
        size: 26,
      ),
      const SizedBox(height: 8),
      teamText(name),
    ],
  );
}
