import 'package:flutter/material.dart';
import '../signin/authenticate.dart';
import 'package:login_signup/login/shared/http_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  HttpHelper httpHelper = HttpHelper();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }


  void signUp() async {
    User user = User(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                username: "sample",
                password: "sample",
                phone: "sample",
                role: "sample",
                description: "sample",
                imageUrl: "sample",
    );
    SignupResponse? response = await httpHelper.signUp(user);
    if (response != null) {
      print(response.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _validateForm,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          // Añadir más campos de texto según sea necesario
          ElevatedButton(
            onPressed: _isButtonEnabled ? signUp: null,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}