import 'package:flutter/material.dart';
import '../locations_info/location7_info.dart';
import 'question_page_template.dart';

class Question7Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question7Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What follows OTP- at the distillery on the second floor?",
      correctAnswer: "DC15S",
      imagePath: 'assets/image7.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location7InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
