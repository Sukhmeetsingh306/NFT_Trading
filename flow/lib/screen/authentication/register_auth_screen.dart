import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/controllers/login_controller.dart';
import '../../models/controllers/register_controllers.dart';
import '../../utils/fonts/google_fonts_utils.dart';
import '../../utils/theme/color/color_theme.dart';
import '../../utils/widget/form/textForm_form.dart';
import '../../utils/widget/space_widget_utils.dart';

class RegisterAuthScreen extends StatefulWidget {
  const RegisterAuthScreen({super.key});

  @override
  State<RegisterAuthScreen> createState() => _RegisterAuthScreenState();
}

class _RegisterAuthScreenState extends State<RegisterAuthScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _otpEmailController = TextEditingController();

  final RegisterController _registerController = RegisterController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  bool _obscureText = true;
  bool _confirmObscureText = true;
  bool hasMinLength = false;
  bool otpSent = false;
  bool otpEmailSent = false;

  final passwordFocusNode = FocusNode();
  final passwordConfirmationFocusNode = FocusNode();

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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _otpEmailController.dispose();
  }

  void _sendEmailOTP() {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid Email')),
      );
      return;
    }

    setState(() {
      otpEmailSent = true;
    });
  }

  void reloadWidget() {
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
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
                image: AssetImage('assets/images/png/backgroundImageFlip.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 50, 0, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                              'Get Started',
                              fontSize: 37,
                            ),
                            sizedBoxH8(),
                            googleInterText(
                              'Create Your account below.',
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
                                      _emailFocusNode,
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
                                      _passwordFocusNode,
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
                                    sizedBoxH15(),
                                    textFormField(
                                      _confirmPasswordController,
                                      _confirmPasswordNode,
                                      'Confirm Password',
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
                                          _confirmObscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _confirmObscureText =
                                                !_confirmObscureText;
                                          });
                                        },
                                      ),
                                      obscureText: _confirmObscureText,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: SizedBox(
                                        width: 116.6,
                                        height: 36.9,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all<Color>(
                                              ColorTheme
                                                  .color.buttonBackgroundColor,
                                            ),
                                            shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {},
                                          child: googleInterText(
                                            'Login',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
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
