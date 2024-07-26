import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/user.dart';

String uri = "http://10.0.2.2:3000";

class AuthRepositary {
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: "",
        name: name,
        email: email,
        password: password,
        token: "",
      );

      final response = await http.post(
        Uri.parse("$uri/api/signup"),
        body: jsonEncode(user.toMap()), // Ensure correct JSON encoding
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Handle success
      } else {
        throw Exception('Failed to sign up user: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error occurred: ${e.toString()}');
    }
  }
}
