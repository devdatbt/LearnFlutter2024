import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  int number = 0;
  DiceRoller({super.key});
  @override
  State<StatefulWidget> createState() {
    return DiceRollerState();
  }
}

class DiceRollerState extends State<DiceRoller> {
  int _number2 = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        onPressed: onPress,
        child: Text(widget.number.toString()),
      ),
    );
  }

  void onPress() {
    setState(() {
      widget.number = Random().nextInt(10) + 1;
    });
  }
}
