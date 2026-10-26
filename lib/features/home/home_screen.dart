import 'package:bmi_calculator/core/colors_managers.dart';
import 'package:bmi_calculator/core/styles_manager.dart';
import 'package:bmi_calculator/core/widgets/custom_appbar.dart';
import 'package:bmi_calculator/core/widgets/custom_btn.dart';
import 'package:bmi_calculator/features/home/cubit/home_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/home_state.dart';
import 'package:bmi_calculator/features/home/widgets/gender_card.dart';
import 'package:bmi_calculator/features/home/widgets/weight_age_card.dart';
import 'package:bmi_calculator/features/result/cubit/result_cubit.dart';
import 'package:bmi_calculator/features/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppbar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderCard(
                  title: "Male",
                  icon: Icons.male,
                  onTap: () {
                    context.read<HomeCubit>().changeGender("male");
                  },
                ),
                SizedBox(width: 9.w),
                GenderCard(
                  title: "Female",
                  icon: Icons.female,
                  onTap: () {
                    context.read<HomeCubit>().changeGender("female");
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              height: 189.h,
              width: 319.w,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Text(
                    "Height",
                    style: StylesManager.whiteBold30.copyWith(
                      color: ColorsManagers.primaryColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Text(
                        "${state.height.toInt()} cm",
                        style: StylesManager.whiteBold30.copyWith(
                          fontSize: 40.sp,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Slider(
                        min: 100,
                        max: 250,
                        activeColor: ColorsManagers.secColor,
                        value: state.height,
                        onChanged: (value) {
                          context.read<HomeCubit>().changeHeight(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return WeightAndAgeCard(
                      age: state.age,
                      weight: state.weight,
                      isAge: false,
                      onIncrease: () {
                        context.read<HomeCubit>().changeWeight(isIncrement: true);
                      },
                      onDecrease: () {
                        context.read<HomeCubit>().changeWeight(isIncrement: false);
                      },
                    );
                  },
                ),
                SizedBox(width: 13.sp),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return WeightAndAgeCard(
                      age: state.age,
                      weight: state.weight,
                      isAge: true,
                      onIncrease: () {
                        context.read<HomeCubit>().changeAge(isIncrement: true);
                      },
                      onDecrease: () {
                        context.read<HomeCubit>().changeAge(isIncrement: false);
                      },
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            CustomBtn(
              onTap: () {
                final result = context.read<HomeCubit>().calculateBmi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<ResultCubit>(),
                      child: ResultScreen(result: result),
                    ),
                  ),
                );
              },
              txt: "Calculate",
            ),
          ],
        ),
      ),
    );
  }
}
