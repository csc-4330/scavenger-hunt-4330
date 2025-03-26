import 'package:flutter/material.dart';
import '../locations_info/location4_info.dart';
import 'question_page_template.dart';

class Question4Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question4Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "How many wooden steps are there in the capstone stairs?",
      correctAnswer: "11",
      imagePath: 'assets/image4.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location4InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
