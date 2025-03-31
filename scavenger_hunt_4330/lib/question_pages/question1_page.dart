import 'package:flutter/material.dart';
import '../locations_info/location1_info.dart';
import 'question_page_template.dart';

class Question1Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question1Page({super.key, required this.index, required this.onAnswer, required this.answered});

  @override
  Widget build(BuildContext context) {
    return QuestionPageTemplate(
      index: index,
      
      prompt: "What is the binary number on the left wall of the atrium?",
      correctAnswer: "101010010",
      imagePath: 'assets/image1.jpg',
      onCorrect: () {
        onAnswer(index);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => Location1InfoPage(answered: answered, onAnswer: onAnswer),
          ),
        );
      },
    );
  }
}
