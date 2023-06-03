import 'package:flutter/material.dart';
import 'package:login_signup/login/signup/signup_screen.dart';

import 'login/signin/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignupScreen()//LoginPage(),
    );
  }
}
