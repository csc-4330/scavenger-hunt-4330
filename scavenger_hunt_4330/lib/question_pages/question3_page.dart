import 'package:flutter/material.dart';
import '../locations_info/location3_info.dart';
import 'question_page_template.dart';

class Question3Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question3Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "How many purple sponsor banners are on the sponsor wall?",
      correctAnswer: "9",
      imagePath: 'assets/image3.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location3InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
