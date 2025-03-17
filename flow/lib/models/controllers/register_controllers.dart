// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert'; // Add this import statement
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../globals.dart';
import '../api/register_api.dart';

class RegisterController {
  Future<void> registerUser({
    required BuildContext context,
    required String name,
    required String password,
    required String email,
  }) async {
    try {
      RegisteringUser user = RegisteringUser(
        id: '',
        name: name,
        email: email,
        password: password,
        // walletAddress: '',
        // usdtBalance: 0,
      );

      http.Response response = await http.post(
          Uri.parse('$uri/api/auth/register'),
          body: user.registerToJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw Exception('Request timed out');
      });

      if (response.statusCode == 201) {
        // // Success
        // var data = jsonDecode(response.body);
        // print("User Registered: ${data['user']}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Registered Successfully!")),
        );
      } else {
        // Error
        print("Error: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: ${jsonDecode(response.body)['message']}"),
          ),
        );
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
