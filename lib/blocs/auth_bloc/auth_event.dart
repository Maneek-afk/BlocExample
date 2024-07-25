part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class MakeSignInRequest extends AuthEvent{

}
final class MakeSignUpRequest extends AuthEvent{

}


