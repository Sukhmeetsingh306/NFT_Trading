import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/fonts/google_fonts_utils.dart';
import '../../utils/routes/navigation_routes.dart';
import '../../utils/theme/color/color_theme.dart';

class DepositMainScreen extends StatefulWidget {
  const DepositMainScreen({super.key});

  static String routeName = 'depositPage';
  static String routePath = '/depositPage';

  @override
  State<DepositMainScreen> createState() => _DepositMainScreenState();
}

class _DepositMainScreenState extends State<DepositMainScreen> {
  String username = "User";
  String usdtBalance = '0.00';

  bool isHidden = false;

  Future<void> _loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username') ?? "User";
      usdtBalance = pref.getString('usdtBalance') ?? '0.00';
    });
    //print("Loaded Username: $username"); // 🔍 Debug SharedPreferences
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.color.primaryBackground,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  googleInterText(
                    'Deposit',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  IconButton(
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        pop(context);
                      }
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 32,
                      color: ColorTheme.color.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.92,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          color: Color(0x4B1A1F24),
                          offset: Offset(
                            0.0,
                            2,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0.94, -1),
                        end: AlignmentDirectional(-0.94, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  googleInterTextWeight4Font16(
                                    isHidden
                                        ? "******"
                                        : username, // Toggle visibility
                                  ),
                                  const SizedBox(height: 5),
                                  googleInterTextWeight4Font16(
                                    isHidden ? "UID: ******" : "UID: 123456",
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isHidden = !isHidden; // Toggle state
                                  });
                                },
                                icon: Icon(
                                  isHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility, // Eye icon toggle
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 35, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              googleInterTextWeight4Font16('Wallet Balance'),
                              googleInterTextWeight4Font16(
                                isHidden ? '****' : usdtBalance,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 35, 20),
                          child: googleInterTextWeight4Font16(
                            isHidden
                                ? '**** **** **** ****'
                                : '1206 1245 6586 7578',
                          ),
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
    );
  }
}
