import 'package:flutter/material.dart';

import '../../screen/authentication/forget_password_auth_screen.dart';
import '../../screen/authentication/login_auth_screen.dart';
import '../../screen/authentication/register_auth_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/loginPage': (context) => const LoginAuthScreen(),
      '/registerPage': (context) => const RegisterAuthScreen(),
      '/forgetPage': (context) => const ForgetPasswordAuthScreen(),
      // '/registerDetailPage': (context) => RegisterDetailAuthScreen(),
    };
  }
}
