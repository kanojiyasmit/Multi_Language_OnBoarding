import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding/bloc/onboarding_bloc.dart';
import 'package:onboarding/onboarding/model/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<OnboardingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          bloc: bloc,
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: bloc.controller,
                  onPageChanged: (value) {
                    bloc.add(OnPageChangedEvent(pageIndex: value));
                  },
                  itemCount: bloc.onboardingData.length,
                  itemBuilder: (BuildContext context, int index) {
                    Onboarding onboarding = bloc.onboardingData[index];
                    return _page(
                      context: context,
                      imageUrl: onboarding.image,
                      title: onboarding.title,
                      description: onboarding.description,
                    );
                  },
                ),
                Positioned(
                  top: 50,
                  width: fullWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _buildDotsIndicator(),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  width: fullWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _buildGetStartedButton(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DotsIndicator(
          dotsCount: 3,
          position: bloc.pageIndex,
          decorator: DotsDecorator(
            color:  const Color(0xFF105CDB).withOpacity(0.1),
            activeColor:  const Color(0xFF105CDB),
            size: const Size.square(9.0),
            activeSize: const Size(9.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc.add(SkipButtonTappedEvent());
          },
          child: Text(
            'Skip',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color:  const Color(0xFF105CDB),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return TextButton(
      onPressed: () {
        bloc.pageIndex == 2
            ? bloc.add(GetStartedButtonTappedEvent())
            : bloc.add(NextButtonTappedEvent());
      },
      child: Text(
        bloc.pageIndex == 2 ? 'Get Started' : 'Next',
      ),
    );
  }

  Widget _page({
    required imageUrl,
    required title,
    required description,
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          imageUrl,
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF4A4646)),
          ),
        ),
      ],
    );
  }
}
