import 'package:bmi_calculator/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitState());

  // 1. Gender Function
  void changeGender(String gender) {
    emit(HomeChangeGenderState(
      selectedGender: gender,
      height: state.height,
      weight: state.weight,
      age: state.age,
      result: state.result,
    ));
  }

  // 2. Height Function
  void changeHeight(double height) {
    emit(HomeChangeHeightState(
      selectedGender: state.selectedGender,
      height: height,
      weight: state.weight,
      age: state.age,
      result: state.result,
    ));
  }

  // 3. Weight Function
  void changeWeight({required bool isIncrement}) {
    final newWeight = isIncrement ? state.weight + 1 : (state.weight > 1 ? state.weight - 1 : 1);
    emit(HomeChangeWeightState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: newWeight,
      age: state.age,
      result: state.result,
    ));
  }

  // 4. Age Function
  void changeAge({required bool isIncrement}) {
    final newAge = isIncrement ? state.age + 1 : (state.age > 1 ? state.age - 1 : 1);
    emit(HomeChangeAgeState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: state.weight,
      age: newAge,
      result: state.result,
    ));
  }

  // 5. Calculate BMI Function
  double calculateBmi({BuildContext? context}) {
    final heightInMeters = state.height / 100;
    final result = state.weight / (heightInMeters * heightInMeters);
    emit(HomeCalculateBmiState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: state.weight,
      age: state.age,
      result: result,
    ));
    return result;
  }

  // Convenience & backward-compatibility aliases
  void toggleGender({required String selectedGender}) => changeGender(selectedGender);
  void setGender({required String gender}) => changeGender(gender);
  void setHeight({required double height}) => changeHeight(height);
  void incrementWeight() => changeWeight(isIncrement: true);
  void decrementWeight() => changeWeight(isIncrement: false);
  void incrementAge() => changeAge(isIncrement: true);
  void decrementAge() => changeAge(isIncrement: false);
  void incrementWeightAge({required bool isAge}) => isAge ? changeAge(isIncrement: true) : changeWeight(isIncrement: true);
  void decrementWeightAge({required bool isAge}) => isAge ? changeAge(isIncrement: false) : changeWeight(isIncrement: false);
}

typedef BmiCubit = HomeCubit;
