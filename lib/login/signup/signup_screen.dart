import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() {
    print('Name: ${nameController.text}');
    print('Password: ${passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}