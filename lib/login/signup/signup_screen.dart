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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _roleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
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
                username: _usernameController.text,
                password: _passwordController.text,
                phone: "sample",
                role: "sample",
                description: "sample",
                imageUrl: "sample",
    );
    SignupResponse? response = await httpHelper.signUp(user);
    print(response.message);
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
            onPressed: _isButtonEnabled ? signUp : null,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    ));
  }
}