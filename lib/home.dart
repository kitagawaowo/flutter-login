import 'package:flutter/material.dart';
import 'package:login_signup/login/signin/login_page.dart';
import 'package:login_signup/login/signup/signup_screen.dart';

import 'login/signin/signin_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> pages = const [
    SignupScreen(),
    SigninScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Albums'),
          BottomNavigationBarItem(
              icon: Icon(Icons.login), label: 'Favorites')
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
