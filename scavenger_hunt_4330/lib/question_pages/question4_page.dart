import 'package:flutter/material.dart';
import '../locations_info/location4_info.dart';
import 'question_page_template.dart';
import '../lsu_colors.dart';

class Question4Page extends StatelessWidget {
  final int index;
  final void Function(int index) onAnswer;
  final List<bool> answered;

  const Question4Page({
    super.key,
    required this.index,
    required this.onAnswer,
    required this.answered,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QuestionPageTemplate(
          index: index,
          prompt: "How many wooden steps are there in the capstone stairs?",
          correctAnswer: "11",
          imagePath: 'assets/image4-min.png',
          onCorrect: () {
            onAnswer(index);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => Location4InfoPage(
                  answered: answered,
                  onAnswer: onAnswer,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Tooltip(
            message: 'Hint',
            textStyle: const TextStyle(fontFamily: 'ProximaNova', color: Colors.white),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(6),
            ),
            child: FloatingActionButton(
              backgroundColor: LSUColors.purple,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => const HintOverlayPage(),
                  ),
                );
              },
              child: const Icon(Icons.help_outline, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class HintOverlayPage extends StatelessWidget {
  const HintOverlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LSUColors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Hint',
          style: TextStyle(
            fontFamily: 'ProximaNova',
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/pft_floor1q4.PNG',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
