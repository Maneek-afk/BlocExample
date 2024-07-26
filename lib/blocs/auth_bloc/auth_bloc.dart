import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/repositories/auth_repositary.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(const AuthState()) {
    on<SignUpBtnPressed>(_onSignUpBtnPressed);
  }

  void _onSignUpBtnPressed(SignUpBtnPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await AuthRepositary().signUpUser(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess("User signed up successfully"));
    } catch (error) {
      emit(AuthFailed(error.toString()));
    }
  }
}
