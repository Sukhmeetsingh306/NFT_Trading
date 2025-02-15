import 'package:flutter/material.dart';

import '../utils/buttons/signup_button.dart';
import '../utils/navigation_utils.dart';
import '../utils/space_utils.dart';
import '../utils/text_utils.dart';
import '../utils/validations/password_validations.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  bool hasMinLength = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 15,
              top: 5,
            ),
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
                sizedBoxH8(),
                AppTextButton(
                  buttonText: "Wallet Connect",
                  onPressed: () async {},
                ),
                Divider(),
                sizedBoxH8(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textFormField(
                        _nameController,
                        'Username',
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH15(),
                      textFormField(
                        _passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
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
                ),
                sizedBoxH8(),
                PasswordValidations(hasMinLength: hasMinLength),
                sizedBoxH15(),
                AppTextButton(
                  buttonText: "Login",
                  onPressed: () async {},
                ),
                sizedBoxH8(),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
