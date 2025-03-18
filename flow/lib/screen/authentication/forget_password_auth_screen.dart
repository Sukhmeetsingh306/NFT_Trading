import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/theme/color/color_theme.dart';
import '../../utils/widget/button_widget_utils.dart';
import '../../utils/widget/form/textForm_form.dart';

class ForgetPasswordAuthScreen extends StatefulWidget {
  const ForgetPasswordAuthScreen({super.key});

  @override
  State<ForgetPasswordAuthScreen> createState() =>
      _ForgetPasswordAuthScreenState();
}

class _ForgetPasswordAuthScreenState extends State<ForgetPasswordAuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //final LoginController _loginController = LoginController();

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
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .085,
                  ),
                  googleInterText(
                    'Forget Password',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 13, 10, 17),
                    child: googleInterText(
                      'Enter the email associated with your account and we will send you a verification code.',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 17),
                    child: textFormField(
                      _emailController,
                      "Email Address",
                      'Enter your email...',
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
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
                          items: emailDomains.map<DropdownMenuItem<String>>(
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
                                        color: ColorTheme.color.textWhiteColor,
                                        fontWeight: FontWeight.w400,
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
                  ),
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: elevatedButton('Send Reset Link', () {}),
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
