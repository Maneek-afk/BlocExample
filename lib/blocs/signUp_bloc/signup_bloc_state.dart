part of 'signup_bloc_bloc.dart';

sealed class SignupBlocState extends Equatable {
  const SignupBlocState();
  
  @override
  List<Object> get props => [];
}

final class SignupBlocInitial extends SignupBlocState {}
