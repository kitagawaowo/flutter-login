import 'package:flutter/material.dart';
import 'package:login_signup/login/shared/http_helper.dart';
import 'package:login_signup/sample_ryan.dart';

import 'authenticate.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  HttpHelper httpHelper = HttpHelper();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  void navigateToHome(LoginResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SampleMain(token: response.token)));
  }
  void signIn() async {
    LoginResponse? response = await httpHelper.login(
        _usernameController.text, _passwordController.text);
    if (response == null) {
      return;
    }
    navigateToHome(response);
    print(response.token);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      onChanged: _validateForm,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'User Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _isButtonEnabled ? signIn: null,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    ));
  }
}