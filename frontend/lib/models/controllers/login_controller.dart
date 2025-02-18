import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../globals.dart';

class LoginController {
  Future<bool> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$uri/api/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final responseData = jsonDecode(response.body);
      // print('Login Response: $responseData'); // 🔍 Debug API response

      if (response.statusCode == 200) {
        if (responseData.containsKey('user')) {
          final pref = await SharedPreferences.getInstance();
          await pref.setString(
              'username', responseData['user']['name'] ?? 'User');
        }
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(responseData['message'] ?? 'Invalid credentials')),
        );
        return false;
      }
    } catch (error) {
      // print('Login Error: $error');
      return false;
    }
  }
}
