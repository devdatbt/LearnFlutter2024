import 'package:demo/quizapp/answer_button.dart';
import 'package:demo/quizapp/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[0]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[1]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[2]),
        ],
      ),
    );
  }
}
