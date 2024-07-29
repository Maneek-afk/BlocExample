part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}

class AuthSnackbarState extends AuthState {
  final String message;

  const AuthSnackbarState(this.message);

  @override
  List<Object> get props => [message];
}