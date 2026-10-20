import 'package:bmi_calculator/features/home/cubit/weight_age_cubit/weight_age_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightAgeCubit extends Cubit<WeightAgeState>{
  WeightAgeCubit():super(WeightInitState(weight: 80,age: 26));

  void incrementWeightAge({required bool isAge}){
    if (isAge) {
      emit(IncrementWeightAgeState(weight: state.weight,age: state.age+1));
    }
    else{
      emit(IncrementWeightAgeState(weight: state.weight+1,age: state.age));
    }
  }
  void decrementWeightAge({required bool isAge}){
    if (isAge) {
      emit(DecrementWeightAgeState(weight: state.weight,age: state.age-1));
    }
   else{
     emit(DecrementWeightAgeState(weight: state.weight-1,age: state.age));
   }
  }
}