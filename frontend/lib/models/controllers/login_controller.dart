import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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

      if (response.statusCode == 200) {
        // If login is successful, return true
        return true;
      } else {
        // Show error message from the backend
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(responseData['message'] ?? 'Invalid credentials')),
        );
        return false;
      }
    } catch (error) {
      print('Login Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
      return false;
    }
  }
}
