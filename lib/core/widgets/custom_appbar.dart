
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              alignment: Alignment.center,
            width: double.infinity,
            height: 50.h,
            child: Text("BMI Calculator",style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: .bold
            ),),
          );
  }

 
}
