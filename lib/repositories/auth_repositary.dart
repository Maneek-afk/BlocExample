import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/user.dart';

String uri = "http://10.0.2.2:3000";

class AuthRepositary {

  //method for creating new user
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
        body: jsonEncode(user.toMap()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userId = data['id'];
        final token = data['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', userId);
        await prefs.setString("token", token);
        
      } else {
        throw Exception('Failed to sign up user: ${response.body}');
      }
    } catch (error) {
      throw Exception('Error occurred: ${error.toString()}');
    }
  }
  
  //method for signing up with existing user 
  Future<void> signInUser({
    required String email,
    required String password,
  })async{
    try {
      User user = User(
        id: "",
        name: "",
        email: email,
        password: password,
        token: "",
      );

      final response = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode(user.toMap()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        }
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final userId = data['id'];
          final token = data['token'];

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('id', userId);
          await prefs.setString("token", token);
        
      } else {
        throw Exception('Failed to sign up user: ${response.body}');
          
        }
    } catch (error) {
      throw Exception('Error occurred: ${error.toString()}');
    }

  }

  Future<void> getUserData() async {
    // Implementation here if needed
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
    await prefs.remove('token');
  }
}
