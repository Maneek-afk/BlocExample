part of 'post_blog_bloc.dart';

sealed class PostBlogEvent extends Equatable {
  const PostBlogEvent();

  @override
  List<Object> get props => [];
}

class postUploadbtnPressed extends PostBlogEvent {
  final String title;
  final String content;
  final String imageUrl;

  const postUploadbtnPressed({
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [title, content, imageUrl];
}
