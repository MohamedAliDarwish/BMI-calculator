import "package:bmi_calculator/core/colors_managers.dart";
import "package:bmi_calculator/core/styles_manager.dart";
import "package:bmi_calculator/core/widgets/custom_appbar.dart";
import "package:bmi_calculator/core/widgets/custom_btn.dart";
import "package:bmi_calculator/features/result/cubit/result_cubit.dart";
import "package:bmi_calculator/features/result/cubit/result_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

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
      // appBar: CustomAppbar(),

      body: SafeArea(
        child: Column(
           
          children: [
            const CustomAppbar(),
            Text(
              "Your Result",
              style: StylesManager.whiteBold30.copyWith(
                fontSize: 40.sp,
              ),
            ),
        
            Container(
              margin: EdgeInsets.only(top: 17.h),
              padding: EdgeInsets.only(top: 16.h,right: 30.w,left: 30.w),
              height: 503.h,
              width: 319.w,
              decoration: BoxDecoration(
                color: ColorsManagers.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: BlocBuilder<ResultCubit,ResultState>(
                  
                  builder: (context, state) {
                  return Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      state.result.status,    
                      style: StylesManager.whiteBold30.copyWith(color: state.result.color,fontSize: 20.sp),
                    ),
                    Text(
                      state.result.score.toStringAsFixed(2),
                      style: StylesManager.whiteBold30.copyWith(
                        fontSize: 64.sp
                      ),
                    ),
                    SizedBox(height: 60.h,),
                    Text(
                      
                      "You Have a Normal Body Weight,Good Job.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.withAlpha(100),fontSize: 16.sp),
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
