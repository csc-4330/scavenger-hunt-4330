import 'package:flutter/material.dart';
import '../locations_info/location5_info.dart';
import 'question_page_template.dart';

class Question5Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question5Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What year was the Tau Beta Pi LSU chapter founded?",
      correctAnswer: "1936",
      imagePath: 'assets/image5.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location5InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
