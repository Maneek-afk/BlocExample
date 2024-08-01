part of 'home_bloc.dart';

 class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class PostFetchSuccess extends HomeState {
  final List<Post> posts;

  PostFetchSuccess(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostFetchFailure extends HomeState {
  final String error;

  PostFetchFailure(this.error);

  @override
  List<Object> get props => [error];
}
