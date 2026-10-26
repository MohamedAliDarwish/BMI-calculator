import 'package:bmi_calculator/features/home/cubit/home_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeCubit & HomeState Tests', () {
    test('initial state is HomeInitState and has default values', () {
      final cubit = HomeCubit();
      expect(cubit.state, isA<HomeInitState>());
      expect(cubit.state.selectedGender, '');
      expect(cubit.state.height, 150.0);
      expect(cubit.state.weight, 80);
      expect(cubit.state.age, 20);
      expect(cubit.state.result, 0.0);
    });

    test('changeGender emits HomeChangeGenderState with updated gender', () {
      final cubit = HomeCubit();
      cubit.changeGender('female');
      expect(cubit.state, isA<HomeChangeGenderState>());
      expect(cubit.state.selectedGender, 'female');

      cubit.changeGender('male');
      expect(cubit.state, isA<HomeChangeGenderState>());
      expect(cubit.state.selectedGender, 'male');
    });

    test('changeHeight emits HomeChangeHeightState with updated height', () {
      final cubit = HomeCubit();
      cubit.changeHeight(175.0);
      expect(cubit.state, isA<HomeChangeHeightState>());
      expect(cubit.state.height, 175.0);
    });

    test('changeWeight emits HomeChangeWeightState', () {
      final cubit = HomeCubit();

      cubit.changeWeight(isIncrement: true);
      expect(cubit.state, isA<HomeChangeWeightState>());
      expect(cubit.state.weight, 81);

      cubit.changeWeight(isIncrement: false);
      expect(cubit.state, isA<HomeChangeWeightState>());
      expect(cubit.state.weight, 80);
    });

    test('changeAge emits HomeChangeAgeState', () {
      final cubit = HomeCubit();

      cubit.changeAge(isIncrement: true);
      expect(cubit.state, isA<HomeChangeAgeState>());
      expect(cubit.state.age, 21);

      cubit.changeAge(isIncrement: false);
      expect(cubit.state, isA<HomeChangeAgeState>());
      expect(cubit.state.age, 20);
    });

    test('calculateBmi emits HomeCalculateBmiState and calculates correct BMI score', () {
      final cubit = HomeCubit();
      // height: 150 cm = 1.5 m; weight: 80 kg; BMI = 80 / (1.5 * 1.5) = 35.555...
      final result = cubit.calculateBmi();
      expect(cubit.state, isA<HomeCalculateBmiState>());
      expect(result, closeTo(35.55, 0.01));
      expect(cubit.state.result, closeTo(35.55, 0.01));
    });
  });
}
