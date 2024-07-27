part of 'landing_page_bloc.dart';

abstract class LandingPageState extends Equatable {
  final int tabIndex;

  const LandingPageState(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

class LandingPageInitial extends LandingPageState {
  const LandingPageInitial(int tabIndex) : super(tabIndex);
}

class LandingPageTabChanged extends LandingPageState {
  const LandingPageTabChanged(int tabIndex) : super(tabIndex);
}
