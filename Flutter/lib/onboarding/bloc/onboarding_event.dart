part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class SkipButtonTappedEvent extends OnboardingEvent {}

class GetStartedButtonTappedEvent extends OnboardingEvent {}

class NextButtonTappedEvent extends OnboardingEvent {}

class OnPageChangedEvent extends OnboardingEvent {
  final int pageIndex;

  OnPageChangedEvent({required this.pageIndex});
}