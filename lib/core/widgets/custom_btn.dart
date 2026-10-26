import 'package:bmi_calculator/core/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final void Function() onTap;
  final String txt;
  const CustomBtn({super.key, required this.onTap, required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 360.w,
        height: 100.h,
        
        color: ColorsManagers.secColor,
        child: Center(
          child: Text(txt, style: TextStyle(color: Colors.white,fontSize: 32.sp)),
        ),
      ),
    );
  }
}
