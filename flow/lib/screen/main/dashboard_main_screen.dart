import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flow/utils/theme/color/color_theme.dart';
import 'package:flow/utils/widget/container_widget_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/widget/space_widget_utils.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({super.key});

  static String routeName = 'dashboardPage';
  static String routePath = '/dashboardPage';

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen>
    with TickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _fadeAnimation;
  // late Animation<Offset> _slideAnimation;
  // late AnimationController _controller1;
  // late Animation<double> _fadeAnimation1;
  // late Animation<Offset> _slideAnimation1;
  // late Animation<double> _scaleAnimation1;

  // late AnimationController _controller2;
  // late Animation<double> _fadeAnimation2;
  // late Animation<Offset> _slideAnimation2;
  // late Animation<double> _scaleAnimation2;
  // late Animation<double> _scaleAnimation;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //     duration: const Duration(milliseconds: 600),
  //     vsync: this,
  //   );

  //   _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
  //     CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  //   );

  //   _slideAnimation = Tween<Offset>(
  //     begin: const Offset(0.0, 0.3),
  //     end: Offset.zero,
  //   ).animate(
  //     CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  //   );

  //   _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
  //     CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  //   );

  //   _controller.forward();
  // _controller1 = AnimationController(
  //   duration: const Duration(milliseconds: 600),
  //   vsync: this,
  // );

  // _fadeAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
  //   CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
  // );

  // _slideAnimation1 = Tween<Offset>(
  //   begin: const Offset(0.0, 0.49),
  //   end: Offset.zero,
  // ).animate(
  //   CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
  // );

  // _scaleAnimation1 = Tween<double>(begin: 1.0, end: 1.0).animate(
  //   CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
  // );

  // _controller1.forward();

  // _controller2 = AnimationController(
  //   duration: const Duration(milliseconds: 600),
  //   vsync: this,
  // );

  // _fadeAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
  //   CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
  // );

  // _slideAnimation2 = Tween<Offset>(
  //   begin: const Offset(0.0, 0.51),
  //   end: Offset.zero,
  // ).animate(
  //   CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
  // );

  // _scaleAnimation2 = Tween<double>(begin: 1.0, end: 1.0).animate(
  //   CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
  // );

  // Future.delayed(const Duration(milliseconds: 50), () {
  //   _controller2.forward();
  // });
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  // _controller1.dispose();
  // _controller2.dispose();
  //   super.dispose();
  // }
  List<Map<String, dynamic>> transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  void loadTransactions() {
    setState(() {
      transactions = [
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
        {
          "title": "New Transaction",
          "amount": "+500",
          "date": "2025/03/22 10:30:00",
          "status": "Pending",
          "color": Colors.blue
        }
      ];
    });
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
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Row(
                children: [
                  googleInterText(
                    'Dashboard',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            // FadeTransition(
            //   opacity: _fadeAnimation,
            //   child: SlideTransition(
            //     position: _slideAnimation,
            //     child: ScaleTransition(
            //       scale: _scaleAnimation,
            //       child:
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
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              googleInterTextWeight4Font16(
                                'UID:123445',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              googleInterTextWeight4Font16('Wallet Balance'),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: googleInterTextWeight4Font16('1029'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                //     ),
                //   ),
                // ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FadeTransition(
                  //   opacity: _fadeAnimation1,
                  //   child: SlideTransition(
                  //     position: _slideAnimation1,
                  //     child: ScaleTransition(
                  //       scale: _scaleAnimation1,
                  //       child:
                  containerDash(
                    context,
                    'Total Income',
                    '+\$12402',
                    ColorTheme.color.tertiaryColor,
                    //     ),
                    //   ),
                    // ),
                  ),
                  // FadeTransition(
                  //   opacity: _fadeAnimation2,
                  //   child: SlideTransition(
                  //     position: _slideAnimation2,
                  //     child: ScaleTransition(
                  //       scale: _scaleAnimation2,
                  //       child:
                  containerDash(
                    context,
                    'Total WIthdrawal',
                    '\$8,392',
                    ColorTheme.color.errorColor,
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
            sizedBoxH15(),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: ColorTheme.color.secondaryBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          googleInterTextWeight4Font12('Quick Service'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: 100,
                            decoration: BoxDecoration(
                              color: ColorTheme.color.primaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.swap_horiz_rounded,
                                    color: ColorTheme.color.whiteColor,
                                    size: 40,
                                  ),
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: googleInterTextWeight4Font12(
                                          'Add Funds')),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: 100,
                            decoration: BoxDecoration(
                              color: ColorTheme.color.primaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {},
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.nfc,
                                    color: ColorTheme.color.whiteColor,
                                    size: 40,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: googleInterTextWeight4Font12('Earn'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          googleInterTextWeight4Font12('Transaction'),
                        ],
                      ),
                    ),
                    transactions.isEmpty
                        ? Center(
                            child:
                                CircularProgressIndicator()) // Show loading while fetching
                        : Flexible(
                            child: ListView.builder(
                              itemCount: transactions.length,
                              shrinkWrap:
                                  true, // Allows ListView to take only the required space
                              physics:
                                  AlwaysScrollableScrollPhysics(), // Enables scrolling
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(
      String title, String amount, String date, String status, Color color) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              googleInterText(title, fontWeight: FontWeight.w600, fontSize: 12),
              googleInterText(date, color: Colors.grey, fontSize: 12),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              googleInterText(amount,
                  color: color, fontWeight: FontWeight.w600, fontSize: 12),
              googleInterText(status, color: color, fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}
