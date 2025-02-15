import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/utils/navigation_utils.dart';
import 'package:frontend/utils/space_utils.dart';
import 'package:frontend/utils/validations/password_validations.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../core/termsAndConditions_core.dart';
import '../utils/buttons/signup_button.dart';
import '../utils/text_utils.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final TextEditingController _otpPhoneController = TextEditingController();
  final TextEditingController _otpEmailController = TextEditingController();

  bool _obscureText = true;
  bool _confirmObscureText = true;
  bool hasMinLength = false;
  bool otpSent = false;
  bool otpEmailSent = false;

  final passwordFocusNode = FocusNode();
  final passwordConfirmationFocusNode = FocusNode();

  String? fullPhoneNumber;

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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _referenceController.dispose();
    _otpPhoneController.dispose();
    _otpEmailController.dispose();
  }

  void _sendOTP() {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }

    setState(() {
      otpSent = true;
    });
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
                  'Create Account',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
                sizedBoxH8(),
                googleText(
                  'Sign up now and start exploring all that our\napp has to offer. We\'re excited to welcome\nyou to our community!',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                sizedBoxH8(),
                // MARK: Add the image here
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      sizedBoxH10(),
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
                                .map<DropdownMenuItem<String>>((String domain) {
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
                      Row(
                        children: [
                          Expanded(
                            child: textFormField(
                              _otpEmailController,
                              'Email OTP',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid OTP';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          AppTextButton(
                            onPressed: () {
                              _sendEmailOTP();
                            },
                            buttonText: 'OTP',
                            buttonWidth: 75,
                            buttonHeight: 45,
                            horizontalPadding: 0,
                            verticalPadding: 0,
                          ),
                        ],
                      ),
                      if (otpEmailSent)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: googleText(
                            'OTP has been sent to your Email',
                            fontSize: 10,
                          ),
                        ),
                      sizedBoxH15(),
                      IntlPhoneField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        initialCountryCode: 'US', // Set default country
                        onChanged: (phone) {
                          //print(phone.completeNumber);
                        },
                        validator: (phone) {
                          if (phone == null || phone.number.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: textFormField(
                              _otpPhoneController,
                              'Phone Number OTP',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid OTP';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          AppTextButton(
                            onPressed: () {
                              _sendOTP();
                            },
                            buttonText: 'OTP',
                            buttonWidth: 75,
                            buttonHeight: 45,
                            horizontalPadding: 0,
                            verticalPadding: 0,
                          ),
                        ],
                      ),
                      if (otpSent)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: googleText(
                            'OTP has been sent to your phone',
                            fontSize: 10,
                          ),
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
                      sizedBoxH15(),
                      textFormField(
                        _confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        'Confirm Password',
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
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
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
                              _confirmObscureText = !_confirmObscureText;
                            });
                          },
                        ),
                        obscureText: _confirmObscureText,
                      ),
                    ],
                  ),
                ),
                sizedBoxH8(),
                PasswordValidations(hasMinLength: hasMinLength),
                Form(
                  child: Column(
                    children: [
                      sizedBoxH8(),
                      textFormField(
                        _referenceController,
                        'Reference Code (Optional)',
                        (value) {
                          if (value != null && value.isNotEmpty) {
                            RegExp regex =
                                RegExp(r'^[A-Z0-9]{6,10}$'); // Example format
                            if (!regex.hasMatch(value)) {
                              return 'Enter a valid reference code (6-10 alphanumeric characters)';
                            }
                          }
                          return null; // No validation error if empty
                        },
                      ),
                    ],
                  ),
                ),
                sizedBoxH8(),

                const TermsAndConditionsText(),
                sizedBoxH15(),
                AppTextButton(
                  buttonText: "Create Account",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      materialRouteNavigatorRep(
                        context,
                        LoginScreen(),
                      );
                    }
                  },
                ),
                sizedBoxH8(),
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
          ),
        ),
      ),
    );
  }
}
