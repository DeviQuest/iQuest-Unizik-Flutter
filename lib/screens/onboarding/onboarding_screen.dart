import 'package:flutter/material.dart';
import 'package:iquest_unizik/screens/onboarding/onboarding_page_view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingPageView(),
    );
  }
}
