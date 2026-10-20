import 'package:bmi_calculator/features/home/cubit/bmi_cubit/bmi_state.dart';
import 'package:bmi_calculator/features/home/cubit/heigth_cubit/height_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/weight_age_cubit/weight_age_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiState>{
  BmiCubit(): super(BmiInitState(result: 0));

  void calculateBmi({required BuildContext context}){
    double height = context.read<HeightCubit>().state.height;
                double heightMeter =  height/ 100;
                int weight = context.read<WeightAgeCubit>().state.weight;
                double result = weight / (heightMeter * heightMeter);

                emit(BmiCalculate(result: result));
  }



}


/**
 * 

 void bmiStatus({required double result}){
  if (result >= 30) {
                  status = "Obesity";
                  color = Colors.red;
                } else if (result >= 25) {
                  status = "Overweight";
                  color = Colors.yellow;
                } else if (result >= 18.5) {
                  status = "Normal";
                  color = Colors.green;
                } else {
                  status = "Underweight";
                  color = Colors.red;
                }
} 

 */