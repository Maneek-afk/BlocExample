import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/post.dart';

String uri = "http://10.0.2.2:3000";

class PostRepositary {

  Future<void> postBlog({
    required String imageUrl,
    required String title,
    required String content,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('id');

    if (userId == null) {
      throw Exception('User ID not found in shared preferences');
    }

    try {
      Post post = Post(
        userId: userId,
        title: title,
        content: content,
        image: imageUrl,
      );

      final response = await http.post(
        Uri.parse("$uri/api/post"),
        body: jsonEncode(post.toMap()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 201) {
        print('Post created successfully');
      } else {
        print('Failed to create post: ${response.body}');
        throw Exception('Failed to create post: ${response.body}');
      }
    } catch (error) {
      print('Error occurred: ${error.toString()}');
      throw Exception('Error occurred: ${error.toString()}');
    }
  }

  Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/getposts'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
}
