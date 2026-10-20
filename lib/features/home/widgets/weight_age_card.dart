// ignore: must_be_immutable
import 'package:bmi_calculator/core/styles_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeightAndAgeCard extends StatelessWidget {
  int age;
  int weight;
  bool isAge;
  // VoidCallback
  final void Function() onIncrease;
  final void Function() onDecrease;
  WeightAndAgeCard({
    super.key,
    required this.age,
    required this.weight,
    required this.isAge,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [
            Text(
              isAge ? "Age" : "Weight",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              isAge ? "$age" : "$weight",
              style: StylesManager.whiteBold30,
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                IconButton(
                  // onPressed: () {
                  //   widget.isAge ? widget.age++ : widget.weight++;
                  //   // widget.weight++;
                  //   setState(() {});
                  // },
                  onPressed: onIncrease,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  // onPressed: () {
                  //   widget.isAge ? widget.age-- : widget.weight--;
                  //   // widget.weight--;
                  //   setState(() {});
                  // },
                  onPressed: onDecrease,
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
