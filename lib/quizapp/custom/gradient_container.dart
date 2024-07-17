
import 'package:demo/quizapp/custom/DiceRoller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({this.text = "", super.key});

  var greenColor = Colors.green;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  DiceRoller(),
    );
  }
}
