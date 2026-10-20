import 'package:bmi_calculator/features/home/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/heigth_cubit/height_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/weight_age_cubit/weight_age_cubit.dart';
import 'package:bmi_calculator/features/home/home_screen.dart';
import 'package:bmi_calculator/features/result/cubit/result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
          BlocProvider<GenderCubit>(create: (context)=> GenderCubit()),
          BlocProvider<HeightCubit>(create: (context)=> HeightCubit()),
          BlocProvider<WeightAgeCubit>(create: (context)=> WeightAgeCubit()),
          BlocProvider<BmiCubit>(create: (context)=> BmiCubit()),
          BlocProvider<ResultCubit>(create: (context)=> ResultCubit()),
        ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: const HomeScreen()),
    );
  }
}
//  BMI Calculator
