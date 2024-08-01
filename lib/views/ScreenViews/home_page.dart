import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/Home_bloc/home_bloc.dart';
import 'package:weather_app/models/postModel.dart';
import 'package:weather_app/repositories/post_repositary.dart';
import 'package:weather_app/widgets/blog_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late Future<List<Postmodel>> _futurePosts;
   
     @override
  void initState() {
    super.initState();
    _futurePosts = fetchData();
  }


Future<List<Postmodel>> fetchData() async {
  var response = await http.get(Uri.parse('http://10.0.2.2:3000/api/getposts'));
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body) as List;
    return jsonData.map((data) => Postmodel.fromMap(data)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: FutureBuilder<List<Postmodel>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder:  (context, index) {
                final post = posts[index];
                return BlogPost(
                  imageurl: post.imageUrl,
                  postTitle: post.title,
                  postContent: post.content,
                  // Implement your desired functionalities for the icons
                  heartIconPressed: () => print('Heart Icon Pressed'),
                  commentIconPressed: () => print('Comment Icon Pressed'),
                  shareIconPressed: () => print('Share Icon Pressed'),
                  commentCount: 0, // You can fetch comment count from the API as well
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator()); 

        },
      ),
    );
  }

}


