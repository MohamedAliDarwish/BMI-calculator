import "package:bmi_calculator/core/colors_managers.dart";
import "package:bmi_calculator/core/styles_manager.dart";
import "package:bmi_calculator/core/widgets/custom_appbar.dart";
import "package:bmi_calculator/core/widgets/custom_btn.dart";
import "package:bmi_calculator/features/result/cubit/result_cubit.dart";
import "package:bmi_calculator/features/result/cubit/result_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class ResultScreen extends StatefulWidget {
 final double result;
  const ResultScreen({
    super.key,
     required this.result,
   
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {


@override
void initState() {
  super.initState();
  context.read<ResultCubit>().getResult(widget.result);
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorsManagers.backgroundColor,
      appBar: CustomAppbar(),

      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Your Result", style: StylesManager.whiteBold30),
            ),

            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 300,
              decoration: BoxDecoration(
                color: ColorsManagers.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: BlocBuilder<ResultCubit,ResultState>(
                  
                  builder: (context, state) {
                  return Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      state.result.status,    
                      style: StylesManager.whiteBold30.copyWith(color: state.result.color),
                    ),
                    Text(
                      state.result.score.toStringAsFixed(2),
                      style: StylesManager.whiteBold30,
                    ),
                    Text(
                      "You Have a Normal Body Weight,Good Job.",
                      style: TextStyle(color: Colors.grey.withAlpha(100)),
                    ),
                  ],
                );
                },)
              ),
            ),
            Spacer(),
            CustomBtn(
              onTap: () {
                Navigator.pop(context);
              },
              txt: "Re - Calculate",
            ),
          ],
        ),
      ),
    );
  }
}
