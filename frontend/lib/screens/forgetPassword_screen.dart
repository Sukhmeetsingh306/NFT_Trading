import 'package:flutter/material.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/utils/space_utils.dart';

import '../core/termsAndConditions_core.dart';
import '../utils/buttons/signup_button.dart';
import '../utils/navigation_utils.dart';
import '../utils/text_utils.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final List<String> emailDomains = [
    'gmail.com',
    'yahoo.com',
    'icloud.com',
    'outlook.com',
  ];
  String selectedDomain = 'gmail.com'; // Default domain

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
              children: [
                Expanded(
                  // Push content to the top
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              googleText(
                                'Reset',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                              sizedBoxH10(),
                              googleText(
                                "Enter email to reset password",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
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
                                                  ),
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
                                  ],
                                ),
                              ),
                              sizedBoxH15(),
                              AppTextButton(
                                buttonText: "Reset",
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    materialRouteNavigatorRep(
                                      context,
                                      LoginScreen(),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom Section
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TermsAndConditionsText(),
                    sizedBoxH10(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          materialRouteNavigatorRep(
                            context,
                            LoginScreen(),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              textSpan(
                                'Already have an account?',
                                fontSize: 14,
                              ),
                              textSpan(
                                ' Login',
                                color: const Color.fromRGBO(36, 124, 255, 1),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
