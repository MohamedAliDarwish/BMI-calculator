import "package:bmi_calculator/core/colors_managers.dart";
import "package:bmi_calculator/core/styles_manager.dart";
import "package:flutter/material.dart";

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManagers.primaryColor,
      title: Text("BMI Calculator", style: StylesManager.whiteBold30),
      centerTitle: true,
    );
  }
}
