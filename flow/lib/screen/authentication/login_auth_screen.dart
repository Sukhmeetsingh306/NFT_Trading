import 'package:flow/screen/authentication/forget_password_auth_screen.dart';
import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flow/utils/routes/navigation_routes.dart';
import 'package:flow/utils/widget/space_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/controllers/login_controller.dart';
import '../../utils/theme/color/color_theme.dart';
import '../../utils/widget/button_widget_utils.dart';
import '../../utils/widget/form/textForm_form.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  static String routeName = 'loginPage';
  static String routePath = '/loginPage';

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  //final LoginController _loginController = LoginController();

  bool _obscureText = true;
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
                                  EdgeInsetsDirectional.fromSTEB(0, 18, 20, 0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    textFormField(
                                      _emailController,
                                      "Email Address",
                                      'Enter your email...',
                                      (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        } else if (!RegExp(
                                                r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                                            .hasMatch(value)) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "@$domain",
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        color: ColorTheme.color
                                                            .textWhiteColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      autofillHints: [AutofillHints.email],
                                      onChanged: (value) {
                                        _updateEmail();
                                      },
                                    ),
                                    sizedBoxH15(),
                                    textFormField(
                                      _passwordController,
                                      'Password',
                                      "Enter your password...",
                                      (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a password';
                                        }
                                        if (value.length < 8) {
                                          return 'Password must be at least 8 characters long';
                                        }
                                        RegExp regex = RegExp(
                                            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$');
                                        if (!regex.hasMatch(value)) {
                                          return 'Password must contain at least one uppercase letter, one number, and one special character';
                                        }
                                        return null;
                                      },
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                      obscureText: _obscureText,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 24, 0, 24),
                                            child: textButton(
                                              'Forget Password?',
                                              () {
                                                materialRouteNavigator(
                                                  context,
                                                  ForgetPasswordAuthScreen(),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                              width: 116.6,
                                              height: 36.9,
                                              child: elevatedButton(
                                                'Login',
                                                () async {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    bool isAuthenticated =
                                                        await _loginController
                                                            .loginUser(
                                                      context: context,
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                    );

                                                    if (isAuthenticated) {
                                                      pushAndRemoveUntil(
                                                        context,
                                                        ForgetPasswordAuthScreen(),
                                                      );
                                                    }
                                                  }
                                                },
                                              )),
                                        ],
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: InkWell(
                                        onTap: () async {},
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0.7),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              googleInterText(
                                                'Don\'t have an account?',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(24, 0, 4, 0),
                                                child: InkWell(
                                                  onTap: () async {},
                                                  child: googleInterText(
                                                    'Create',
                                                    color: ColorTheme.color
                                                        .buttonBackgroundColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_rounded,
                                                color: ColorTheme.color
                                                    .buttonBackgroundColor,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
