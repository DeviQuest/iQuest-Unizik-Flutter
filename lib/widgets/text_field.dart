import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart' as color;

class MyTextField extends StatelessWidget {

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.textEditingController
  }) : super(key: key);

  final String hintText;
  final TextInputType inputType;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    int maxLength = inputType == TextInputType.phone ? 11 : 100;

    return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 50,
          decoration: BoxDecoration(
            color: color.AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(5)
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              counterText: ''
            ),
            controller: textEditingController,
            maxLength: maxLength,
            textInputAction: TextInputAction.done,
            keyboardType: inputType,
            style: const TextStyle(
              fontSize: 15
            )
          ),
        );
  }
}
