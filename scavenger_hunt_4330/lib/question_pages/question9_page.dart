import 'package:flutter/material.dart';
import '../locations_info/location9_info.dart';
import 'question_page_template.dart';

class Question9Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question9Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What is the room number of the Computer Science office in PFT?",
      correctAnswer: "3325",
      imagePath: 'assets/image9.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location9InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
