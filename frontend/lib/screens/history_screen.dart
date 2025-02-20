import 'package:flutter/material.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/background_core.dart';
import '../utils/buttons/signup_button.dart';
import '../utils/code/appbar_code.dart';
import '../utils/code/floating_code.dart';
import '../utils/navigation_utils.dart';
import '../utils/text_utils.dart';
import 'account/dashboard_account.dart';
import 'deposit_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool bep = false;
  bool trc = false;
  bool isVisible = false;

  String walletAddress = "Fetching...";

  @override
  void initState() {
    super.initState();
    _loadWalletAddress();
  }

  Future<void> _loadWalletAddress() async {
    final pref = await SharedPreferences.getInstance();
    String? savedAddress = pref.getString('walletAddress');

    print("Retrieved Wallet Address: $savedAddress"); // Debugging

    if (mounted) {
      setState(() {
        walletAddress = savedAddress ?? "No Wallet Address Found";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCode("History"),
      endDrawer: endDrawer(context),
      body: Stack(
        children: [
          Background(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      containerWhite(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: googleText(
                                'Earning (USDT)',
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: googleText('12.57', fontSize: 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                columnWithdraw("12.56", "Total Earning"),
                                columnWithdraw("100", "WithDraw"),
                                columnWithdraw("12.57", "UnDrawn"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      containerWhite(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text("Node 1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Icon(Icons.help_outline, color: Colors.grey),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _depositAddressItem(
                              "USDT Deposit Address (BEP-20)",
                              isVisible
                                  ? walletAddress
                                  : "***************************",
                              isVisible,
                              () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      containerWhite(
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // teamColumnImage(
                                  //   'assets/icons/deposits.png',
                                  //   'Deposit         ',
                                  // ),
                                  teamColumnImage(
                                    'assets/icons/withdrawal.png',
                                    'Withdraw',
                                    onTap: () {
                                      materialRouteNavigator(
                                        context,
                                        const HistoryScreen(),
                                      );
                                    },
                                  ),
                                  teamColumnImage(
                                    'assets/icons/setting.png',
                                    'Settings',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxH10(),
                      AppTextButton(
                          buttonText: 'Deposit',
                          onPressed: () {
                            materialRouteNavigator(
                              context,
                              const DepositScreen(),
                            );
                          }),
                      sizedBoxH8(),
                      containerWhite(_buildHistorySection()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .085,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingRowCode(context),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> transactions = [
    {
      "title": "Withdraw USDT (BSC)",
      "amount": "-100",
      "date": "2025/02/16 15:36:58",
      "status": "Pending",
      "color": Colors.orange
    },
    {
      "title": "Trial fund recovery",
      "amount": "-150",
      "date": "2025/02/15 03:15:57",
      "status": "Success",
      "color": Colors.green
    },
    {
      "title": "Deposit USDT",
      "amount": "+100.01",
      "date": "2025/02/12 20:08:26",
      "status": "Success",
      "color": Colors.green
    },
    {
      "title": "Trial fund",
      "amount": "+150",
      "date": "2025/02/12 19:24:55",
      "status": "Success",
      "color": Colors.green
    },
  ];
  Widget _buildHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        googleText("History", fontSize: 18, fontWeight: FontWeight.bold),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _transactionItem(
                transaction["title"],
                transaction["amount"],
                transaction["date"],
                transaction["status"],
                transaction["color"],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _transactionItem(
      String title, String amount, String date, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              googleText(title, fontWeight: FontWeight.w600, fontSize: 12),
              googleText(date, color: Colors.grey, fontSize: 12),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              googleText(amount,
                  color: color, fontWeight: FontWeight.w600, fontSize: 12),
              googleText(status, color: color, fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}

Column columnWithdraw(String amount, String text) {
  return Column(
    children: [
      Row(
        children: [
          Image.asset(
            'assets/images/t.png',
            width: 14,
            height: 14,
          ),
          const SizedBox(width: 4),
          googleText(
            amount,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
      googleText(
        text,
        fontSize: 12,
        color: Colors.grey,
        fontWeight: FontWeight.normal,
      ),
    ],
  );
}

Widget _depositAddressItem(
    String title, String wallet, bool isVisible, VoidCallback toggle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      googleText(
        title,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      const SizedBox(height: 4),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            googleText(
              wallet,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            GestureDetector(
              onTap: toggle,
              child: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

Widget containerWhite(Widget child) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
      ],
    ),
    child: child,
  );
}
