import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flow/utils/fonts/google_fonts_utils.dart';
import 'package:flow/utils/routes/navigation_routes.dart';
import 'package:flow/utils/widget/space_widget_utils.dart';
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
    String email = _emailController.text.split('@')[0];
    _emailController.text = '$email@$selectedDomain';
    _emailController.selection = TextSelection.fromPosition(
      TextPosition(offset: email.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 900;
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/png/backgroundImage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isLargeScreen ? 500 : double.infinity,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 50 : 20,
                        vertical: 50,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: isLargeScreen
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/png/im.png',
                                width: 70,
                                height: 80,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(width: 10),
                              googleInterText('Application Title'),
                            ],
                          ),
                          sizedBoxH15(),
                          googleReadexProText('Welcome Back', fontSize: 37),
                          sizedBoxH8(),
                          googleInterText(
                            'Login to access your Account',
                            fontSize: 20,
                          ),
                          sizedBoxH15(),
                          Form(
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
                                            child: Text(
                                              "@$domain",
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                color: ColorTheme
                                                    .color.textWhiteColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: [AutofillHints.email],
                                  onChanged: (value) => _updateEmail(),
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
                                sizedBoxH15(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textButton(
                                      'Forget Password?',
                                      () => materialNamedRouteNavigator(
                                          context, '/forgetPage'),
                                    ),
                                    elevatedButton(
                                      'Login',
                                      () => materialNamedRouteNavigator(
                                          context, '/dashboardPage'),
                                    ),
                                  ],
                                ),
                                sizedBoxH15(),
                                Opacity(
                                  opacity: 0.8,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width:
                                          isLargeScreen ? 400 : double.infinity,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(8),
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
                                            padding: EdgeInsets.only(left: 5),
                                            child: InkWell(
                                              onTap: () =>
                                                  materialNamedRouteNavigator(
                                                      context, '/registerPage'),
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
                                            color: ColorTheme
                                                .color.buttonBackgroundColor,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
