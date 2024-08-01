// import 'package:flutter/material.dart';
// import 'package:weather_app/models/post.dart';

// class PostViewModel extends ChangeNotifier {
//   final PostRepository _postRepository;
//   List<Post> _posts = [];
//   bool _isLoading = false;
//   String _errorMessage = '';

//   List<Post> get posts => _posts;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;

//   PostViewModel(this._postRepository);

//   Future<void> fetchPosts() async {
//     _isLoading = true;
//     notifyListeners();
//     try {
//       _posts = await _postRepository.getPosts();
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

// class PostRepository {
//   getPosts() {}

//   Future<List<Post>> fetchPosts() {}
// }
