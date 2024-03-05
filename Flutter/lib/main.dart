import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding/bloc/onboarding_bloc.dart';
import 'package:onboarding/onboarding/view/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnBoarding Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            fixedSize:
            MaterialStateProperty.all(const Size(double.infinity, 50)),
            backgroundColor:
            MaterialStateProperty.all(const Color(0xFF105CDB)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            foregroundColor:
            MaterialStateProperty.all(const Color(0xFFFFFFFF)),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      home: BlocProvider(
        create: (_) => OnboardingBloc(),
        child: const OnboardingPage(),
      ),
    );
  }
}
