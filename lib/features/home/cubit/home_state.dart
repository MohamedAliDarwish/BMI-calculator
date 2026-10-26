import 'package:bmi_calculator/features/home/model/bmi_model.dart';

abstract class HomeState {
  final String selectedGender;
  final double height;
  final int weight;
  final int age;
  final double result;

  const HomeState({
    this.selectedGender = "",
    this.height = 150.0,
    this.weight = 80,
    this.age = 20,
    this.result = 0.0,
  });

  String get gender => selectedGender;

  BmiModel get bmiData => BmiModel(
    gender: selectedGender,
    age: age,
    weight: weight,
    height: height,
  );
}

class HomeInitState extends HomeState {
  const HomeInitState({
    super.selectedGender = "",
    super.height = 150.0,
    super.weight = 80,
    super.age = 20,
    super.result = 0.0,
  });
}

class HomeChangeGenderState extends HomeState {
  const HomeChangeGenderState({
    required super.selectedGender,
    required super.height,
    required super.weight,
    required super.age,
    required super.result,
  });
}

class HomeChangeHeightState extends HomeState {
  const HomeChangeHeightState({
    required super.selectedGender,
    required super.height,
    required super.weight,
    required super.age,
    required super.result,
  });
}

class HomeChangeWeightState extends HomeState {
  const HomeChangeWeightState({
    required super.selectedGender,
    required super.height,
    required super.weight,
    required super.age,
    required super.result,
  });
}

class HomeChangeAgeState extends HomeState {
  const HomeChangeAgeState({
    required super.selectedGender,
    required super.height,
    required super.weight,
    required super.age,
    required super.result,
  });
}

class HomeCalculateBmiState extends HomeState {
  const HomeCalculateBmiState({
    required super.selectedGender,
    required super.height,
    required super.weight,
    required super.age,
    required super.result,
  });
}

// Aliases for compatibility
// typedef HomeIncrementWeightAgeState = HomeChangeWeightState;
// typedef HomeDecrementWeightAgeState = HomeChangeWeightState;
// typedef HomeGenderState = HomeChangeGenderState;
// typedef HomeHeightState = HomeChangeHeightState;
// typedef HomeWeightAgeState = HomeChangeWeightState;
// typedef BmiState = HomeState;
// typedef BmiInitState = HomeInitState;
// typedef BmiCalculate = HomeCalculateBmiState;
