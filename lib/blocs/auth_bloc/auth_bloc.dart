import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repositories/auth_repositary.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositary authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<SignUpBtnPressed>(_onSignUpBtnPressed);
    on<SignInBtnPressed>(_onSignInBtnPressed);
    on<CheckAuthStatus>(onCheckAuthStatus);
    on<SignOut>(_onSignOut);
  }

  void _onSignUpBtnPressed(SignUpBtnPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await authRepository.signUpUser(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess("User signed up successfully"));
    } catch (error) {
      emit(AuthFailed(error.toString()));
    }
  }

  FutureOr<void> _onSignInBtnPressed(SignInBtnPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try { 
      await authRepository.signInUser(
        email: event.email,
        password: event.password
      );
      emit(AuthSuccess("User SignIn succesfully"));
    } catch (error) {
      emit(AuthSnackbarState(error.toString()));
    }
  }

  void onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) async {
    final token = await authRepository.getToken();
    if (token != null) {
      emit(AuthSuccess("Status On"));
    } else {
      emit(AuthInitial());
    }
  }

  void _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    await AuthRepositary().clearUserData(); 
    print('User data cleared. Emitting AuthInitial state.');
    emit(AuthInitial()); 
  }

  
}
