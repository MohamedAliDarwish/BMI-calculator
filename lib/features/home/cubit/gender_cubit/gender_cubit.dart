import 'package:bmi_calculator/features/home/cubit/gender_cubit/gender_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCubit extends Cubit<GenderState>{
  GenderCubit():super(GenderInitState(selectedGender: ""));

  void toggleGender({required String selectedGender}){
    if (selectedGender == "male") {
      emit(MaleSelectedState(selectedGender: "male"));
    }else {
      emit(MaleSelectedState(selectedGender: "female"));
    }
    
  }
 
}