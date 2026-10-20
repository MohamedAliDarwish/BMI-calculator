abstract class WeightAgeState {
  final int weight;
  final int age;


  WeightAgeState({required this.weight, required this.age});
}

class WeightInitState extends WeightAgeState{
  WeightInitState({required super.weight, required super.age});
}
class IncrementWeightAgeState extends WeightAgeState{
  IncrementWeightAgeState({required super.weight, required super.age});
}
class DecrementWeightAgeState extends WeightAgeState{
  DecrementWeightAgeState({required super.weight, required super.age});
}