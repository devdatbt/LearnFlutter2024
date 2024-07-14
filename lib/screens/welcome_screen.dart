import 'package:demo/screens/signin_screen.dart';
import 'package:demo/screens/signup_screen.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/custom_scaffold.dart';
import 'package:demo/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                  child: Center(
                      child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'Welcome back \n',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text:
                          '\nEnter personal details  to your employee account.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w200))
                ]),
              )))),
           Flexible(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    const Expanded(
                      child: WelcomeButton(
                        textColor: Colors.white,
                        buttonText: "Sign up",
                        onTap: SignUpScreen(),
                        buttonColor: Colors.transparent,)),
                    Expanded(
                        child: WelcomeButton(
                          textColor: lightColorScheme.primary,
                          buttonText: "Sign in",
                          onTap: SignInScreen(),
                          buttonColor: Colors.white,)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
