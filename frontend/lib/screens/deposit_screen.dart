import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/core/background_core.dart';
import 'package:frontend/screens/history_screen.dart';
import 'package:frontend/utils/code/appbar_code.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/text_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  bool _isSnackbarVisible = false;

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

  void _copyToClipboard(BuildContext context) {
    if (_isSnackbarVisible) return;

    Clipboard.setData(ClipboardData(text: walletAddress));

    setState(() {
      _isSnackbarVisible = true;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text('Address copied to clipboard'),
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        )
        .closed
        .then((_) {
      setState(() {
        _isSnackbarVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCode('Deposit'),
      endDrawer: endDrawer(context),
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  containerWhite(
                    Row(
                      children: [
                        googleText(
                          "USDT Deposit Address (BEP-20)",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                  sizedBoxH10(),
                  containerWhite(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        googleText('Deposit Chain', fontSize: 18),
                        sizedBoxH5(),
                        googleText(
                          'Minimum Deposit : 50 USDT',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        sizedBoxH5(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: googleText(
                            '*You can only deposit USDT-BEP-20 to this address.\n  Other assets cannot be recovered',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.redAccent,
                          ),
                        ),
                        sizedBoxH10(),
                        googleText(
                          'This address supports USDT only',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        sizedBoxH10(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  left: 8,
                                  right: 8,
                                  bottom: 0,
                                ),
                                child: googleText(
                                  'USDT Deposit Address',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 0,
                                        left: 8,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                .09,
                                        bottom: 0,
                                      ),
                                      child: googleText(
                                        walletAddress,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.copy,
                                          size: 20,
                                        ),
                                        onPressed: () =>
                                            _copyToClipboard(context),
                                      ),
                                      sizedBoxH5(),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        sizedBoxH10(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 0.0,
                              left: 8,
                              right: 8,
                              bottom: 0,
                            ),
                            child: Row(
                              children: [
                                googleText(
                                  'Chain',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(width: 12),
                                googleText(
                                  'BSC(BEP-20)',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
