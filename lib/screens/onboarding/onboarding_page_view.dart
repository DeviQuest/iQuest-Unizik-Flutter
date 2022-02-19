import 'package:flutter/material.dart';
import 'package:iquest_unizik/data/local/shared_pref_util.dart';
import 'package:iquest_unizik/screens/create_profile_screen.dart';
import 'package:iquest_unizik/utils/constants.dart';
import '/data/models/onboarding.dart';
import 'widgets/onboarding_page_item.dart';
import 'widgets/onboarding_page_dots.dart';
import 'package:iquest_unizik/utils/colors.dart' as color;

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  _OnBoardingPageViewState createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: onBoardingItems.length,
              itemBuilder: (ctx, i) => OnBoardingPageItem(index: i),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                child: Text(
                  (_currentPage == 3) ? 'Done' : 'Skip',
                  style: const TextStyle(
                      fontSize: 15,
                      color: color.AppColors.accent
                  ),
                ),
                onTap: _skipOnBoarding,
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    onPressed: _scrollToNextPage,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    for (int i = 0; i < onBoardingItems.length; i++)
                      (i == _currentPage) ? const OnBoardingPageDots(isActive: true)
                          : const OnBoardingPageDots(isActive: false),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _skipOnBoarding() {
    _openCreateProfileScreen();
  }

  _scrollToNextPage() {
    _currentPage++;
    (_currentPage <= 3) ? _pageController.jumpToPage(_currentPage) : _openCreateProfileScreen();
  }

  _openCreateProfileScreen() async {
    await SharedPrefUtil.putBooleanInPref(Constants.HAS_SEEN_ONBOARDING, true);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const CreateProfileScreen()
        )
    );
  }
}
