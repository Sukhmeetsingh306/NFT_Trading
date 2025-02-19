import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/utils/buttons/dashboard_buttons.dart';
import 'package:frontend/utils/code/appbar_code.dart';
import 'package:frontend/utils/code/balance_code.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/text_utils.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/background_core.dart';
import '../../utils/code/detector_code.dart';
import '../../utils/code/floating_code.dart';
import '../../utils/navigation_utils.dart';
import '../assets_screen.dart';
import 'reserve_account.dart';

class DashboardAccount extends StatefulWidget {
  const DashboardAccount({super.key});

  @override
  State<DashboardAccount> createState() => _DashboardAccountState();
}

class _DashboardAccountState extends State<DashboardAccount> {
  String username = "User";
  String usdtBalance = '0.00';

  bool isHidden = false;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username') ?? "User";
      usdtBalance = pref.getString('usdtBalance') ?? '0.00';
    });
    //print("Loaded Username: $username"); // 🔍 Debug SharedPreferences
  }

  // List<Color> generateRandomColors(int count) {
  //   Random random = Random();
  //   return List.generate(count, (index) {
  //     return Color.fromRGBO(
  //       random.nextInt(256), // R
  //       random.nextInt(256), // G
  //       random.nextInt(256), // B
  //       1, // Opacity
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //List<Color> gradientColors = generateRandomColors(3);

    return Scaffold(
      appBar: appBarCode("DashBoard"),
      endDrawer: endDrawer(context),
      body: Stack(
        children: [
          Background(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // CircleAvatar(
                          //   radius: 50,
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       gradient: LinearGradient(
                          //         colors:
                          //             gradientColors, // Random gradient colors
                          //         begin: Alignment.topLeft,
                          //         end: Alignment.bottomRight,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[300],
                            child: ClipOval(
                              child: RandomAvatar(
                                username, // Unique seed for consistent avatars
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  googleText(
                                    isHidden
                                        ? "******"
                                        : username, // Toggle visibility
                                  ),
                                  const SizedBox(height: 5),
                                  googleText(
                                    isHidden ? "UID: ******" : "UID: 123456",
                                    //isHidden ? "UID: ******" : "UID: ${uid}",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.03),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isHidden = !isHidden; // Toggle state
                                    });
                                  },
                                  icon: Icon(
                                    isHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility, // Eye icon toggle
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       bottom:
                              //           MediaQuery.of(context).size.height * 0.03),
                              //   child: IconButton(
                              //     onPressed: () {},
                              //     icon: const Icon(
                              //       Icons.calendar_today,
                              //       size: 20,
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
                            ],
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
                          // SizedBox(
                          //   width: 15,
                          // ),
                          // gestureDetectorRich(
                          //   Image.asset('assets/icons/nft_list.png',
                          //       width: 24, height: 24),
                          //   onTap: () {
                          //     materialRouteNavigator(
                          //       context,
                          //       const ReserveAccount(),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    sizedBoxH10(),
                    containerWhiteDash(
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
                            usdtBalance,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(),
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
                          Divider(),
                          earning(context, 'Comprehensive', '100', '100'),
                          earning(context, 'Reserve', '0', '90000'),
                          earning(context, 'Team', '50000', '0'),
                          earning(context, 'Activity', '0', '0'),
                          earning(context, 'Stake', '0', '0'),
                        ],
                      ),
                    ),
                    sizedBoxH8(),
                    containerWhiteDash(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          googleText(
                            'My Teams',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  teamColumnImage(
                                    'assets/icons/community.png',
                                    'Community\nenthusiasts',
                                  ),
                                  teamColumnImage(
                                    'assets/icons/trophy.png',
                                    'Community\ncontribution',
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
                    sizedBoxH8(),
                    containerWhiteDash(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          googleText(
                            'My Orders',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  teamColumn('0', 'Orders'),
                                  teamColumn('0', 'Processing'),
                                  teamColumn('0', 'Bought'),
                                  teamColumn('0', 'Sold'),
                                ],
                              ),
                              sizedBoxH15(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  teamColumnImage(
                                    'assets/icons/NFT.png',
                                    'NFTs               ',
                                  ),
                                  teamColumnImage(
                                    'assets/icons/details.png',
                                    'Details               ',
                                    onTap: () {
                                      materialRouteNavigator(
                                        context,
                                        const AssetsScreen(),
                                      );
                                    },
                                  ),
                                  teamColumnImage(
                                    'assets/icons/deposits.png',
                                    'Deposit         ',
                                  ),
                                  teamColumnImage(
                                    'assets/icons/withdrawal.png',
                                    'Withdraw',
                                    onTap: () {
                                      materialRouteNavigator(
                                        context,
                                        const ReserveAccount(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    sizedBoxH8(),
                    containerWhiteDash(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          googleText(
                            'Common Functions',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(),
                          sizedBoxH8(),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  teamColumnImage(
                                    'assets/icons/tutorial.png',
                                    'Tutorials',
                                  ),
                                  teamColumnImage(
                                    'assets/icons/setting.png',
                                    'Settings',
                                  ),
                                  teamColumnImage(
                                    'assets/icons/mint.png',
                                    'Mint',
                                  ),
                                  teamColumnImage(
                                    'assets/icons/collection.png',
                                    'Collections',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .085,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingRowCode(context),
        ],
      ),
    );
  }
}

Widget teamColumn(String amount, String name) {
  return SizedBox(
    width: 80, // Ensures all columns have equal width
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        teamText(amount),
        teamText(name),
      ],
    ),
  );
}

Widget teamColumnImage(String image, String name, {GestureTapCallback? onTap}) {
  return SizedBox(
    width: 80, // Ensures equal width
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        gestureDetectorRich(
          Image.asset(image, width: 24, height: 24),
          onTap: onTap ?? () {},
        ),
        const SizedBox(height: 8),
        teamText(name),
      ],
    ),
  );
}
