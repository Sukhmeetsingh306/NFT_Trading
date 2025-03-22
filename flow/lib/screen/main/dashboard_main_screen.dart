import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flow/utils/theme/color/color_theme.dart';
import 'package:flow/utils/widget/container_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/routes/navigation_routes.dart';
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
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  late AnimationController _controller1;
  late Animation<double> _fadeAnimation1;
  late Animation<Offset> _slideAnimation1;
  late Animation<double> _scaleAnimation1;

  late AnimationController _controller2;
  late Animation<double> _fadeAnimation2;
  late Animation<Offset> _slideAnimation2;
  late Animation<double> _scaleAnimation2;
  late Animation<double> _scaleAnimation;

  late AnimationController _controller3;
  late Animation<double> _fadeAnimation3;
  late Animation<Offset> _moveAnimation3;

  String username = "User";
  String usdtBalance = '0.00';

  bool isHidden = false;

  @override
  void initState() {
    super.initState();
    loadTransactions();
    _loadUsername();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(0.0, 0.49),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _scaleAnimation1 = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _controller1.forward();

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0.0, 0.51),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    _scaleAnimation2 = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 50), () {
      _controller2.forward();
    });

    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    _fadeAnimation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _moveAnimation3 =
        Tween<Offset>(begin: Offset(0, 0.1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 50), () {
      _controller3.forward();
    });
  }

  Future<void> _loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username') ?? "User";
      usdtBalance = pref.getString('usdtBalance') ?? '0.00';
    });
    //print("Loaded Username: $username"); // 🔍 Debug SharedPreferences
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> transactions = [];

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
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  googleInterText(
                    'Dashboard',
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
                      Icons.login_rounded,
                      color: ColorTheme.color.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Padding(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        googleInterTextWeight4Font16(
                                          isHidden
                                              ? "******"
                                              : username, // Toggle visibility
                                        ),
                                        const SizedBox(height: 5),
                                        googleInterTextWeight4Font16(
                                          isHidden
                                              ? "UID: ******"
                                              : "UID: 123456",
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
                                            : Icons
                                                .visibility, // Eye icon toggle
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 35, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    googleInterTextWeight4Font16(
                                        'Wallet Balance'),
                                    googleInterTextWeight4Font16(
                                      isHidden ? '****' : usdtBalance,
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeTransition(
                    opacity: _fadeAnimation1,
                    child: SlideTransition(
                      position: _slideAnimation1,
                      child: ScaleTransition(
                        scale: _scaleAnimation1,
                        child: containerDash(
                          context,
                          'Total Income',
                          '+\$12402',
                          ColorTheme.color.tertiaryColor,
                        ),
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _fadeAnimation2,
                    child: SlideTransition(
                      position: _slideAnimation2,
                      child: ScaleTransition(
                        scale: _scaleAnimation2,
                        child: containerDash(
                          context,
                          'Total WIthdrawal',
                          '\$8,392',
                          ColorTheme.color.errorColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxH15(),
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation3,
                child: SlideTransition(
                  position: _moveAnimation3,
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              googleInterTextWeight4Font12('Quick Service'),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                                  onTap: () async {
                                    materialNamedRouteNavigator(
                                        context, '/depositPage');
                                  },
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
                                          'Add Funds',
                                        ),
                                      ),
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
                                        child: googleInterTextWeight4Font12(
                                            'Earn'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  shrinkWrap: true,
                                  physics: AlwaysScrollableScrollPhysics(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(
    String title,
    String amount,
    String date,
    String status,
    Color color,
  ) {
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
