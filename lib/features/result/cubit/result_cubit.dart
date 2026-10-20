
import 'package:bmi_calculator/features/result/cubit/result_state.dart';
import 'package:bmi_calculator/features/result/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultCubit extends Cubit<ResultState>{
  ResultCubit():super(ResultInitState(result: ResultModel(score: 0, status: "", color: Colors.black)));

  void getResult(double result){
    if (result >= 30) {
                 
                  emit(ResultScoreState(result: ResultModel(score: result, status: "Obesity", color: Colors.red)));
                } else if (result >= 25) {
                 
                  emit(ResultScoreState(result: ResultModel(score: result, status: "Overweight", color: Colors.yellow)));

                } else if (result >= 18.5) {
                 
                  emit(ResultScoreState(result: ResultModel(score: result, status: "Normal", color: Colors.green)));

                  
                } else {
                  emit(ResultScoreState(result: ResultModel(score: result, status: "Underweight", color: Colors.red)));
                }
  }
}