import 'package:flutter/material.dart';
import 'package:login_signup/login/shared/http_helper.dart';

import 'authenticate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  HttpHelper httpHelper = HttpHelper();
  

  late LoginResponse? response;
  late SignupResponse? signupResponse;
  Future initiateLogin() async {
    response = LoginResponse(id: '0', username: 'uwu', token: 'error');
    signupResponse = SignupResponse(message: 'error');
    response = await httpHelper.login('string4', 'string4');
    signupResponse = await httpHelper.signUp(User(
      firstName: 'string3',
      lastName: 'string3',
      username: 'string6',
      password: 'string6',
      phone: 'string3',
      role: 'string3',
      description: 'string3',
      imageUrl: 'string3',
    ));
    setState(() {
      response = response;
      signupResponse = signupResponse;
    });
    //print(response);
  }
  @override
  void initState() {
    initiateLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Login'),
        Text('id: ${response!.id}'),
        Text('username: ${response!.username}'),
        Text('token: ${response!.token}', style: const TextStyle(fontSize: 18.0),),
        Text('message: ${signupResponse!.message}', style: const TextStyle(fontSize: 18.0)),
      ],
    );
  }
}