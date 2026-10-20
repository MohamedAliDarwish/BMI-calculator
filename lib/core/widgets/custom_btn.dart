import 'package:bmi_calculator/core/colors_managers.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final void Function() onTap;
  final String txt;
  const CustomBtn({super.key, required this.onTap, required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        color: ColorsManagers.secColor,
        child: Center(
          child: Text(txt, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
