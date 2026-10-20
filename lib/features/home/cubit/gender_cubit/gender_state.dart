// TODO: refactor it


abstract class GenderState {
  final String selectedGender;
  
  
  GenderState({required this.selectedGender});
}

class GenderInitState extends GenderState{
  GenderInitState({required super.selectedGender});
}

class MaleSelectedState extends GenderState{
  MaleSelectedState({required super.selectedGender});
}

class FemaleSelectedState extends GenderState{
  FemaleSelectedState({required super.selectedGender});
}