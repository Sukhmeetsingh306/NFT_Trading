import 'package:flutter/material.dart';

import '../../core/background_core.dart';
import '../../utils/code/appbar_code.dart';
import '../../utils/navigation_utils.dart';
import '../../utils/text_utils.dart';
import 'dashboard_account.dart';

class DepositAccount extends StatefulWidget {
  const DepositAccount({super.key});

  @override
  State<DepositAccount> createState() => _DepositAccountState();
}

class _DepositAccountState extends State<DepositAccount> {
  bool bep = false;
  bool trc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCode("Deposit"),
        endDrawer: endDrawer(context),
        body: Background(
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
                              'Assets (USDT)',
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
                              "USDT Deposit Address (BEP-20)", bep, () {
                            setState(() {
                              bep = !bep;
                            });
                          }),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                      const DepositAccount(),
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
                  ],
                ),
              ),
            ),
          ),
        ));
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
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        googleText(
          text,
          fontSize: 12,
          color: Colors.grey,
        ),
      ],
    );
  }
}

Widget _depositAddressItem(String title, bool isVisible, VoidCallback toggle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      googleText(title, fontWeight: FontWeight.bold, fontSize: 12),
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
              isVisible ? "1AbcXyZ45678ghJkl" : "***************************",
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
