import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart' as color;

class BottomSheetTrigger extends StatelessWidget {

  const BottomSheetTrigger({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color.AppColors.textFieldColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            height: 20,
            width: 20,
            child: Icon(
                Icons.arrow_drop_down
            ),
          ),
        ],
      ),
    );
  }
}
