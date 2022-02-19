import 'package:flutter/material.dart';
import 'package:iquest_unizik/utils/colors.dart' as color;

class OnBoardingPageDots extends StatelessWidget {
  final bool isActive;

  const OnBoardingPageDots({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(left: 1, right: 1),
      duration: const Duration(milliseconds: 150),
      height: 12,
      width: isActive ? 33 : 12,
      decoration: BoxDecoration(
        color: isActive ? color.AppColors.accent : color.AppColors.accentSecondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
