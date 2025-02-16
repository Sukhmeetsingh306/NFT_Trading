import 'dart:convert';

class LoginUser {
  final String name;
  final String password;

  LoginUser({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
