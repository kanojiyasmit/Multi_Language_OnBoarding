import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding/model/onboarding.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;
  List<Onboarding> onboardingData = [
    Onboarding(
      image: 'assets/onboarding1.svg',
      title: 'Easy Time Management',
      description:
      'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
    ),
    Onboarding(
      image: 'assets/onboarding2.svg',
      title: 'Increase Work Effectiveness',
      description:
      'Time management and the determination of more important tasks will give your job statistics better and always improve',
    ),
    Onboarding(
      image: 'assets/onboarding3.svg',
      title: 'Reminder Notification',
      description:
      'The advantage of this application is that it also provides reminders for you so you dont forget to keep doing your assignments well and according to the time you have set',
    ),
  ];
  OnboardingBloc() : super(OnboardingInitial()) {
    on<SkipButtonTappedEvent>((event, emit) {
      print("Skip Button Tapped");
    });
    on<NextButtonTappedEvent>((event, emit) {
      controller.animateToPage(pageIndex + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    });
    on<GetStartedButtonTappedEvent>((event, emit) {
      print("Get Started Button Tapped");
    });
    on<OnPageChangedEvent>((event, emit) {
      pageIndex = event.pageIndex;
      emit(OnboardingPageChangedState());
    });
  }
}
