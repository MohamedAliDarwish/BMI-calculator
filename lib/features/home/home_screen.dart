import 'package:bmi_calculator/core/colors_managers.dart';
import 'package:bmi_calculator/core/styles_manager.dart';
import 'package:bmi_calculator/core/widgets/custom_appbar.dart';
import 'package:bmi_calculator/core/widgets/custom_btn.dart';
import 'package:bmi_calculator/features/home/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/gender_cubit/gender_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/heigth_cubit/height_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/heigth_cubit/height_state.dart';
import 'package:bmi_calculator/features/home/cubit/weight_age_cubit/weight_age_cubit.dart';
import 'package:bmi_calculator/features/home/cubit/weight_age_cubit/weight_age_state.dart';
import 'package:bmi_calculator/features/home/widgets/gender_card.dart';
import 'package:bmi_calculator/features/home/widgets/weight_age_card.dart';
import 'package:bmi_calculator/features/result/cubit/result_cubit.dart';
import 'package:bmi_calculator/features/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.primaryColor,
      appBar: CustomAppbar(),

      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              children: [
                GenderCard(
                  title: "Male",
                  icon: Icons.male,
                  
                  onTap: () {
                   context.read<GenderCubit>().toggleGender(selectedGender: "male");
                    
                    

                  },
                ),
                 GenderCard(
                  title: "Female",
                  icon: Icons.female,
                  onTap: () {
                    
                   context.read<GenderCubit>().toggleGender(selectedGender: "female");
                  },
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Height",
                    style: StylesManager.whiteBold30.copyWith(
                      color: ColorsManagers.primaryColor,
                    ),
                  ),

                 BlocBuilder<HeightCubit,HeightState>(builder: (context, state) {
                   return  Text(
                    "${state.height.toInt()} cm",
                    style: StylesManager.whiteBold30,
                  );
                 },),

                  BlocBuilder<HeightCubit,HeightState>(builder: (context, state) {
                    return Slider(
                    min: 100,
                    max: 250,
                    activeColor: ColorsManagers.secColor,
                    value: state.height,
                    onChanged: (value) {
                      context.read<HeightCubit>().changeHeight(value);
                    },
                  );
                  },)
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                // WeightAndAgeCard(age: age, weight: weight, isAge: false),
                // WeightAndAgeCard(age: age, weight: weight, isAge: true),
                BlocBuilder<WeightAgeCubit,WeightAgeState>(
                  builder: (context, state) {
                    return WeightAndAgeCard(
                    age: state.age,
                    weight: state.weight,
                    isAge: false,
                    onIncrease: () {
                      context.read<WeightAgeCubit>().incrementWeightAge(isAge: false);
                    },
                    onDecrease: () {
                      context.read<WeightAgeCubit>().decrementWeightAge(isAge: false);
                    },
                  );
                  },
                ),

                BlocBuilder<WeightAgeCubit,WeightAgeState>(
                  builder: (context, state) {
                    return WeightAndAgeCard(
                    age: state.age,
                    weight: state.weight,
                    isAge: true,
                    onIncrease: () {
                      context.read<WeightAgeCubit>().incrementWeightAge(isAge: true);
                    },
                    onDecrease: () {
                      context.read<WeightAgeCubit>().decrementWeightAge(isAge: true);
                    },
                  );
                  },
                ),

               
              ],
            ),

            Spacer(),
            CustomBtn(
              onTap: (){
                context.read<BmiCubit>().calculateBmi(context: context);
                double result = context.read<BmiCubit>().state.result;
              //  print(result);
              //  

                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(result: result)));

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider.value(
      value: context.read<ResultCubit>(),
      child: ResultScreen(result: result),
    ),
  ),
);

              },
             
              txt: "Calculate",
            ),

           
          ],
        ),
      ),
    );
  }
}
