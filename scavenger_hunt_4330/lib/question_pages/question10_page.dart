import 'package:flutter/material.dart';
import '../locations_info/location10_info.dart';
import 'question_page_template.dart';

class Question10Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question10Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What year did Patrick F. Taylor pass away?",
      correctAnswer: "2004",
      imagePath: 'assets/image10.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location10InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
