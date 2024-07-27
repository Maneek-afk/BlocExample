import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(const LandingPageInitial(0)) {
    on<TabChangedEvent>((event, emit) {
      emit(LandingPageTabChanged(event.tabIndex));
    });
  }
}
