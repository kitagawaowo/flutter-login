import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../signin/authenticate.dart';
class HttpHelper {
  final String baseUrl = 'https://zendriver.azurewebsites.net/api/v1/users/';
  //final String baseUrl = 'http://192.168.1.2/api/v1/users/';

  Future<LoginResponse> login(String name, String password) async {
    final url = '${baseUrl}sign-in';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
      'username': name,
      'password': password,
    }));
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 500) {
      throw Exception('Incorrect username or password');
    } else {
      throw Exception('Failed to login');
      //throw Exception('Server error');
    }
  }

  Future<SignupResponse> signUp(User user) async {
    final url = '${baseUrl}sign-up';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == HttpStatus.ok) {
      return SignupResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == HttpStatus.badRequest) {
      throw Exception('Username already exists');
    } else {
      throw Exception('Failed to sign up');
      //throw Exception('Server error');
    }
  }
}