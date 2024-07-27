part of 'landing_page_bloc.dart';

abstract class LandingPageEvent extends Equatable {
  const LandingPageEvent();

  @override
  List<Object> get props => [];
}

class TabChangedEvent extends LandingPageEvent{
  final int tabIndex;

  TabChangedEvent({required this.tabIndex});

}
