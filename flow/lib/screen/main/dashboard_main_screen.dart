import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flow/utils/theme/color/color_theme.dart';
import 'package:flutter/material.dart';

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
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.color.primaryBackground,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 60, 0, 20),
        child: Column(
          children: [
            Row(
              children: [
                googleInterText(
                  'Dashboard',
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            // FadeTransition(
            //   opacity: _fadeAnimation,
            //   child: SlideTransition(
            //     position: _slideAnimation,
            //     child: ScaleTransition(
            //       scale: _scaleAnimation,
            //       child:
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
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
              padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.44,
                    decoration: BoxDecoration(
                      color: ColorTheme.color.secondaryBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3F14181B),
                          offset: Offset(
                            0.0,
                            3,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          googleInterTextWeight4Font16('Total Income',
                              fontSize: 12),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: googleInterTextWeight4Font16(
                              '+\$12402',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: ColorTheme.color.tertiaryColor,
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Color(0x4D39D2C0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                googleInterTextWeight4Font16(
                                  '4.5%',
                                  fontSize: 14,
                                  color: ColorTheme.color.tertiaryColor,
                                ),
                                Icon(
                                  Icons.trending_up_rounded,
                                  color: ColorTheme.color.tertiaryColor,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.44,
                    decoration: BoxDecoration(
                      color: ColorTheme.color.secondaryBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3F14181B),
                          offset: Offset(
                            0.0,
                            3,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          googleInterTextWeight4Font16('Total WIthdrawal',
                              fontSize: 12),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                              child: googleInterText(
                                '\$8,392',
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: ColorTheme.color.tertiaryColor,
                              )),
                          Container(
                            width: 80,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Color(0x9AF06A6A),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                googleInterTextWeight4Font16(
                                  '4.5%',
                                  fontSize: 14,
                                ),
                                Icon(
                                  Icons.trending_up_rounded,
                                  color: ColorTheme.color.errorColor,
                                  size: 24,
                                ),
                              ],
                            ),
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
    );
  }
}
