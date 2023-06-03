import 'dart:convert';

import 'package:http/http.dart' as http;

import '../signin/authenticate.dart';
class HttpHelper {
  final String baseUrl = 'http://192.168.1.2/api/v1/users/';

  Future<LoginResponse> login(String name, String password) async {
    final url = '${baseUrl}sign-in';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
      'username': name,
      'password': password,
    }));
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(response.statusCode);
      //throw Exception('Failed to login');
    }
  }

  Future<SignupResponse> signUp(User user) async {
    final url = '${baseUrl}sign-up';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return SignupResponse.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(response.statusCode);
      //throw Exception('Failed to login');
    }
  }
}