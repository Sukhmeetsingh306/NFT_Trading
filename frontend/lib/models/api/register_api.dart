import 'dart:convert';

class RegisteringUser {
  final String id;
  final String name;
  final String email;
  final String password;
  // final String walletAddress;
  // final double usdtBalance;

  RegisteringUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    // required this.walletAddress,
    // required this.usdtBalance,
  });

  // Convert instance to JSON
  Map<String, dynamic> registerToMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      // 'walletAddress': walletAddress,
      // 'usdtBalance': usdtBalance.toString(), // Convert back to string for JSON
    };
  }

  // Factory constructor to create an instance from JSON
  factory RegisteringUser.registerFromJson(Map<String, dynamic> json) {
    return RegisteringUser(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      // walletAddress: json['walletAddress'] as String,
      // usdtBalance:
      //     double.tryParse(json['usdtBalance']['\$numberDecimal']) ?? 0.0,
    );
  }

  String registerToJson() => json.encode(registerToMap());
}
