import 'package:bmi_calculator/core/colors_managers.dart';
import 'package:bmi_calculator/core/styles_manager.dart';
import 'package:bmi_calculator/features/home/cubit/home_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;
  const GenderCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final isSelected = state.selectedGender.toLowerCase() == title.toLowerCase();
          return Container(
            width: 155.w,
            height: 180.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorsManagers.secColor
                  : Colors.grey.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 96.sp),
                Text(
                  title,
                  style: StylesManager.whiteBold30.copyWith(color: Colors.grey, fontSize: 20.sp),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
