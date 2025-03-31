import 'package:flutter/material.dart';
import '../locations_info/location8_info.dart';
import 'question_page_template.dart';

class Question8Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question8Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What is the Professor Shepherd's office room number?",
      correctAnswer: "3272W",
      imagePath: 'assets/image8.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location8InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
