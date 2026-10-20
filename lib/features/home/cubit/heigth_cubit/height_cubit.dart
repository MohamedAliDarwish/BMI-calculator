import 'package:bmi_calculator/features/home/cubit/heigth_cubit/height_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightCubit extends Cubit<HeightState>{
  HeightCubit():super(HeightInitState(height: 100));

  void changeHeight(double height){
    emit(SetHeightState(height: height));
  }
}