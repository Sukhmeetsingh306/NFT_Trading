import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flow/utils/widget/space_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme/color/color_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = 'loginPage';
  static String routePath = '/loginPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  //final LoginController _loginController = LoginController();

  //bool _obscureText = true;
  bool hasMinLength = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final List<String> emailDomains = [
    'gmail.com',
    'yahoo.com',
    'icloud.com',
    'outlook.com',
  ];
  String selectedDomain = 'gmail.com';

  void _updateEmail() {
    String email =
        _emailController.text.split('@')[0]; // Keep only the username part
    _emailController.text = '$email@$selectedDomain';
    _emailController.selection = TextSelection.fromPosition(
      TextPosition(offset: email.length), // Keep cursor before the '@'
    );
  }

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
              padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBoxH15(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 24, 0, 17),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15,
                          ),
                          child: googleInterText('Application Title'),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            googleReadexProText(
                              'Welcome Back',
                              fontSize: 37,
                            ),
                            sizedBoxH8(),
                            googleInterText(
                              'Login to access your Account',
                              fontSize: 20,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 20, 0),
                              child: TextFormField(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                  labelStyle: GoogleFonts.getFont(
                                    'Inter',
                                    color: ColorTheme.color.textWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  hintText: 'Enter your email',
                                  hintStyle: GoogleFonts.getFont(
                                    'Inter',
                                    color: ColorTheme.color.textWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors
                                          .transparent, // Ensure transparent border
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true, // Ensure it's filled
                                  fillColor: Colors
                                      .black, // Set desired background color
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 16),
                                  suffixIcon: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedDomain,
                                      alignment: Alignment.centerRight,
                                      dropdownColor: Colors.black,
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          setState(() {
                                            selectedDomain = newValue;
                                            _updateEmail();
                                          });
                                        }
                                      },
                                      items: emailDomains
                                          .map<DropdownMenuItem<String>>(
                                              (String domain) {
                                        return DropdownMenuItem<String>(
                                          value: domain,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "@$domain",
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  color: ColorTheme
                                                      .color.textWhiteColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ), // Smaller dropdown icon
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  color: Colors
                                      .white, // Ensure text color is visible
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: [AutofillHints.email],
                                onChanged: (value) {
                                  _updateEmail();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
