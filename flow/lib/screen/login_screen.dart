import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/png/backgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/png/im.png',
                          width: 70,
                          height: 80,
                          fit: BoxFit.fitWidth,
                        ),
                        /*
                          SvgPicture.asset(
                          'assets/images/svg/files.svg',
                          width: 170,
                          height: 60,
                          fit: BoxFit.fitWidth,
                        ),
                           */
                        // if (!(Theme.of(context).brightness == Brightness.dark))
                        //   Image.asset(
                        //     'assets/images/finWallet_logo_landscapeDark@3x.png',
                        //     width: 170,
                        //     height: 60,
                        //     fit: BoxFit.fitWidth,
                        //   ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
