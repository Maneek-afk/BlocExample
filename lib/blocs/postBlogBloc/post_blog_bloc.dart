import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/repositories/post_repositary.dart';

part 'post_blog_event.dart';
part 'post_blog_state.dart';

class PostBlogBloc extends Bloc<PostBlogEvent, PostBlogState> {
  final PostRepositary postRepositary;

  PostBlogBloc({required this.postRepositary}) : super(const PostBlogState()) {
    on<postUploadbtnPressed>(_postUpload); // Map event to handler
  }

  void _postUpload(postUploadbtnPressed event, Emitter<PostBlogState> emit) async {
    emit(PostBlogLoading()); // Emit loading state before starting the post
    try {
      await postRepositary.postBlog(
        title: event.title,
        content: event.content,
        imageUrl: event.imageUrl
      );
      emit(PostBlogSuccess("Post uploaded successfully"));
    } catch (e) {
      emit(PostBlogFailure("Failed to upload: ${e.toString()}"));
    }
  }
}

