import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBlocBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  SignupBlocBloc() : super(SignupBlocInitial()) {
    on<SignupBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
