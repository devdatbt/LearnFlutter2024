import 'package:demo/screens/signin_screen.dart';
import 'package:demo/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton(
      {super.key,
      this.buttonText,
      this.onTap,
      this.buttonColor,
      this.textColor});

  final String? buttonText;
  final Widget? onTap;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: buttonColor!,
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(50))),
          child: Text(
            buttonText!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor!, fontSize: 20.0, fontWeight: FontWeight.bold),
          )),
    );
  }
}
