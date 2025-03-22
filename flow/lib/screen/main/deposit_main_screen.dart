import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
