import 'package:flutter/material.dart';
import '../locations_info/location2_info.dart';
import 'question_page_template.dart';

class Question2Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question2Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      prompt: "What is the room number for the BASF lab?",
      correctAnswer: "1154",
      imagePath: 'assets/image2.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location2InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
