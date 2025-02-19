import 'package:flutter/material.dart';
import 'package:frontend/screens/account/dashboard_account.dart';
import 'package:frontend/screens/login_screen.dart';

import 'screens/account/reserve_account.dart';
import 'screens/assets_screen.dart';
import 'withdraw.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white30),
        useMaterial3: true,
      ),
      //home: Withdraw(),
      home: LoginScreen(),
    );
  }
}
