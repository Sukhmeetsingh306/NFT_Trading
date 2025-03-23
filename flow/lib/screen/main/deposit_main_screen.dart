import 'package:flow/utils/widget/container_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/fonts/google_fonts_utils.dart';
import '../../utils/routes/navigation_routes.dart';
import '../../utils/theme/color/color_theme.dart';
import '../../utils/widget/space_widget_utils.dart';

class DepositMainScreen extends StatefulWidget {
  const DepositMainScreen({super.key});

  static String routeName = 'depositPage';
  static String routePath = '/depositPage';

  @override
  State<DepositMainScreen> createState() => _DepositMainScreenState();
}

class _DepositMainScreenState extends State<DepositMainScreen>
    with TickerProviderStateMixin {
  String username = "User";
  String usdtBalance = '0.00';
  String walletAddress = "Fetching...";

  bool isHidden = false;
  bool _isCopied = false;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  Future<void> _loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username') ?? "User";
      usdtBalance = pref.getString('usdtBalance') ?? '0.00';
    });
    //print("Loaded Username: $username"); // 🔍 Debug SharedPreferences
  }

  Future<void> _loadWalletAddress() async {
    final pref = await SharedPreferences.getInstance();
    String? savedAddress = pref.getString('walletAddress');

    print("Retrieved Wallet Address: $savedAddress"); // Debugging

    if (mounted) {
      setState(() {
        walletAddress =
            savedAddress ?? "0x3E79B2d4FDa2a93f145B7Bc2D46fc435B396d46e";
      });
    }
  }

  void _copyToClipboard(BuildContext context) {
    if (_isCopied) return;

    Clipboard.setData(ClipboardData(text: walletAddress));

    setState(() {
      _isCopied = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isCopied = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadWalletAddress();

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
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.color.secondaryBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                                            isHidden =
                                                !isHidden; // Toggle state
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 35, 20),
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
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
                child: Column(
                  children: [
                    containerField(
                      width: MediaQuery.sizeOf(context).width,
                      height: 60,
                      googleInterTextWeight4Font16(
                        "USDT Deposit Address (BEP-20)",
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
                child: Column(
                  children: [
                    containerField(
                      width: MediaQuery.sizeOf(context).width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          googleInterTextWeight4Font16(
                            "Deposit Chain",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          sizedBoxH5(),
                          googleInterTextWeight4Font14ColorGrey(
                            'Minimum Deposit: 50 USDT',
                          ),
                          sizedBoxH10(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: googleInterText(
                              '*You can only deposit USDT-BEP-20 to this address.\n  Other assets cannot be recovered',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.redAccent,
                            ),
                          ),
                          sizedBoxH10(),
                          googleInterTextWeight4Font14ColorGrey(
                            'This address supports USDT only',
                          ),
                          sizedBoxH10(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
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
                                  child: googleInterText(
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
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .09,
                                          bottom: 0,
                                        ),
                                        child: googleInterText(
                                          walletAddress,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: AnimatedSwitcher(
                                            duration:
                                                Duration(milliseconds: 300),
                                            transitionBuilder:
                                                (widget, animation) {
                                              return ScaleTransition(
                                                scale: animation,
                                                child: widget,
                                              );
                                            },
                                            child: IconButton(
                                              key: ValueKey<bool>(_isCopied),
                                              icon: Icon(
                                                _isCopied
                                                    ? Icons.check
                                                    : Icons.copy,
                                                size: 20,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () =>
                                                  _copyToClipboard(context),
                                            ),
                                          ),
                                        ),
                                        sizedBoxH5(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          sizedBoxH15(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset('assets/images/png/barcode.jpg'),
                          ),
                          sizedBoxH15(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
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
                                  child: Row(
                                    children: [
                                      googleInterText(
                                        'Chain',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(width: 12),
                                      googleInterTextWeight4Font16(
                                        'BSC(BEP-20)',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          sizedBoxH20(),
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
    );
  }
}
