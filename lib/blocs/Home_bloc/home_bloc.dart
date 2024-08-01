import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchInitialPosts>(_FetchInitialPosts);
  }

  Future<void> _FetchInitialPosts(FetchInitialPosts event, Emitter<HomeState> emit) async {
    var client = http.Client();
    List<Post> posts = [];
    try {
      var response = await client.get(Uri.parse('http://10.0.2.2:3000/api/getposts'));
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body);
        for (var item in result) {
          Post post = Post.fromMap(item as Map<String, dynamic>);
          posts.add(post);
        }
        emit(PostFetchSuccess(posts));
      } else {
        emit(PostFetchFailure('Failed to load posts'));
      }
    } catch (e) {
      emit(PostFetchFailure(e.toString()));
    } finally {
      client.close(); // Close the HTTP client to free resources
    }
  }
}
