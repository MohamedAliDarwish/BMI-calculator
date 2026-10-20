import 'package:bmi_calculator/features/result/models/result_model.dart';

abstract class ResultState {
  final ResultModel result;

  ResultState({required this.result});
  
}

class ResultInitState extends ResultState{
  ResultInitState({required super.result});
}

class ResultScoreState extends ResultState{
  ResultScoreState({required super.result});
}