import 'package:flutter/material.dart';
import '../utils/colors.dart' as color;
import '../utils/app_utils.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key, required this.hintText, required this.items}) : super(key: key);

  final List<String> items;
  final String hintText;

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 50,
        decoration: BoxDecoration(
            color: color.AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(5)
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _dropDownValue,
            items: widget.items.map((value) => DropdownMenuItem(
              child: Text(
                value,
                style: const TextStyle(
                    fontSize: 15
                ),
              ),
              value: value,
            )).toList(),
            onChanged: (value) => setState(() {
              _dropDownValue = value;
              getText(_dropDownValue!);
            }),
            isExpanded: true,
            iconSize: 30.0,
            hint: Text(
              widget.hintText,
              style: const TextStyle(
                  fontSize: 15,
              ),
            ),
          ),
        )
    );
  }

  static String getText(String dropDownValue) {
    return dropDownValue;
  }
}
