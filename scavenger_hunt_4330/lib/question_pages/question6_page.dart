import 'package:flutter/material.dart';
import '../locations_info/location6_info.dart';
import 'question_page_template.dart';

class Question6Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question6Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What is the maximum occupancy at Panera Bread?",
      correctAnswer: "88",
      imagePath: 'assets/image6.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location6InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
