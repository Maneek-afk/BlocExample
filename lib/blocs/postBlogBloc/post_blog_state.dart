part of 'post_blog_bloc.dart';

class PostBlogState extends Equatable {
  const PostBlogState();
  
  @override
  List<Object> get props => [];
}

class PostBlogInitial extends PostBlogState {}

class PostBlogLoading extends PostBlogState {}

class PostBlogSuccess extends PostBlogState {
  final String message;
  
  const PostBlogSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class PostBlogFailure extends PostBlogState {
  final String error;

  const PostBlogFailure(this.error);

  @override
  List<Object> get props => [error];
}
