import 'package:bmi_calculator/core/styles_manager.dart';
import 'package:bmi_calculator/features/home/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/gender_cubit/gender_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  // final bool isSelected;
  final void Function() onTap;
  const GenderCard({
    super.key,
    required this.icon,
    required this.title,
    // required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: BlocBuilder<GenderCubit,GenderState>(
          builder: (context, state) {
            return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: state.selectedGender == title.toLowerCase()
                  ? Colors.pink
                  : Colors.grey.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            //Female
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 60),
                Text(
                  title,
                  style: StylesManager.whiteBold30.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
          },
           
        ),
      ),
    );
  }
}
