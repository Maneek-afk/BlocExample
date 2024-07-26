part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpBtnPressed extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpBtnPressed({
    required this.name,
    required this.email,
    required this.password
  });

  @override
  List<Object> get props => [name, email, password];
}

class SignInBtnPressed extends AuthEvent{
  final String email;
  final String password;

  const SignInBtnPressed({
    required this.email, 
    required this.password
  });
    @override
  List<Object> get props => [ email, password];
}


class CheckAuthStatus extends AuthEvent {}

class SignOut extends AuthEvent {}
