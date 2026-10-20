sealed class HeightState {
  final double height;

  const HeightState({required this.height});
}



class HeightInitState extends HeightState{
  HeightInitState({required super.height});
}
class SetHeightState extends HeightState{
    SetHeightState({required super.height});

}