part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}


final class SignInLoading extends SignInState {}


final class SignInSuccess extends SignInState {}


final class NavigatetoHome extends SignInState {}


final class SignInFailure extends SignInState {
  final String errorMessage;

  const SignInFailure(this.errorMessage);
}

class EmailError extends SignInState {
  final String errorMessage;

  const EmailError(this.errorMessage);
}

class PasswordError extends SignInState {
  final String errorMessage;

  const PasswordError(this.errorMessage);
}
