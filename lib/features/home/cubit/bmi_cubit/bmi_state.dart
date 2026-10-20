abstract class BmiState {
  final double result;

  BmiState({required this.result});
}


class BmiInitState extends BmiState{
  BmiInitState({required super.result});
}

class BmiCalculate extends BmiState{
  BmiCalculate({required super.result});
}