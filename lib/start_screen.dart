import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Opacity(
            opacity: 0.5,
            child: Image.asset('assets/images/cr7.jpg', width: 300)),
        const Text(
          "Welcome to Quiz App!",
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz")),
      ]),
    );
  }
}
