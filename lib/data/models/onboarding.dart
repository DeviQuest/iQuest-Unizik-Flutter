class OnBoardingItem {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  OnBoardingItem({
    required this.sliderImageUrl,
    required this.sliderHeading,
    required this.sliderSubHeading
  });
}


final onBoardingItems = [
  OnBoardingItem(
      sliderImageUrl: 'assets/images/onboarding_1.png',
      sliderHeading: 'Standard Exams',
      sliderSubHeading: 'With access to over 5,000+ study questions, get a taste of the exam feeling.'),
  OnBoardingItem(
      sliderImageUrl: 'assets/images/onboarding_2.png',
      sliderHeading: 'Rule Unizik',
      sliderSubHeading: 'Compete with your peers. Let all of Unizik know who the Champ is.'),
  OnBoardingItem(
      sliderImageUrl: 'assets/images/onboarding_3.png',
      sliderHeading: 'GSS Summaries',
      sliderSubHeading: 'You didn\'t have the time to read the textbooks? We got you covered.'),
  OnBoardingItem(
      sliderImageUrl: 'assets/images/onboarding_4.png',
      sliderHeading: 'Join Group Chat',
      sliderSubHeading: 'Join Thousands of other students, discuss and have fun')
];