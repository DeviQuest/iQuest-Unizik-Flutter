import 'package:flutter/material.dart';
import 'package:iquest_unizik/data/models/onboarding.dart';

class OnBoardingPageItem extends StatelessWidget {
  final int index;
  const OnBoardingPageItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 0.6,
          width: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(onBoardingItems[index].sliderImageUrl))),
        ),
        const SizedBox(
          height: 60.0,
        ),
        Text(
          onBoardingItems[index].sliderHeading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              onBoardingItems[index].sliderSubHeading,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
