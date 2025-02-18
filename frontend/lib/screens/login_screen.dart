import 'package:flutter/material.dart';
import 'package:frontend/screens/forgetPassword_screen.dart';

import '../models/controllers/login_controller.dart';
import '../utils/buttons/signup_button.dart';
import '../utils/navigation_utils.dart';
import '../utils/space_utils.dart';
import '../utils/text_utils.dart';
import '../utils/validations/password_validations.dart';
import 'account/dashboard_account.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 10,
            top: 5,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                googleText(
                  'Login',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
                sizedBoxH8(),
                googleText(
                  'Login To Continue Using The App',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center content
                    children: [
                      sizedBoxH15(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            sizedBoxH15(),
                            AppTextButton(
                              buttonText: "Wallet Connect",
                              onPressed: () async {},
                            ),
                            Divider(),
                            sizedBoxH15(),
                            textFormField(
                              _emailController,
                              'Email',
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
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ), // Smaller dropdown icon
                                        ],
                                      ),
                                    );
                                  }).toList(),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              'Password',
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
                            ),
                          ],
                        ),
                      ),
                      sizedBoxH8(),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            materialRouteNavigator(
                              context,
                              ForgetPasswordScreen(),
                            );
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                textSpan(
                                  'Forget Password?',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      sizedBoxH8(),
                      PasswordValidations(hasMinLength: hasMinLength),
                      sizedBoxH15(),
                      AppTextButton(
                        buttonText: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool isAuthenticated =
                                await _loginController.loginUser(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            if (isAuthenticated) {
                              pushAndRemoveUntil(
                                context,
                                DashboardAccount(),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // Bottom Section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          materialRouteNavigator(
                            context,
                            SignUpScreen(),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              textSpan(
                                'Don\'t Have An Account?',
                                fontSize: 14,
                              ),
                              textSpan(
                                ' Create Account',
                                fontSize: 14,
                                color: const Color.fromRGBO(36, 124, 255, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
