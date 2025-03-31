import 'package:flutter/material.dart';
import '/lsu_colors.dart'; // Ensure LSU Colors are defined here (purple, gold, etc.)
import '/question_pages/question1_page.dart';
import '/question_pages/question2_page.dart';
import '/question_pages/question3_page.dart';
import '/question_pages/question4_page.dart';
import '/question_pages/question5_page.dart';
import '/question_pages/question6_page.dart';
import '/question_pages/question7_page.dart';
import '/question_pages/question8_page.dart';
import '/question_pages/question9_page.dart';
import '/question_pages/question10_page.dart';

Widget buildLocationInfoPage({
  required BuildContext context,
  required String imagePath,
  required String text,
  required int currentIndex,
  required List<bool> answered,
  required void Function(int) onAnswer,
}) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Location Info"),
      backgroundColor: LSUColors.purple, // LSU purple app bar
    ),
    body: Container(
      color: LSUColors.lightGold, // LSU Light Gold background
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(imagePath, width: double.infinity, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: LSUColors.lightGold, // Background color light gold
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LSUColors.purple, width: 2), // Purple border
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal, // Regular text weight
                  color: LSUColors.black, // Black text for contrast
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            if (answered.contains(false)) 
              ElevatedButton(
                onPressed: () {
                  int next = answered.indexOf(false);
                  if (next != -1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => _getQuestionPage(next, onAnswer, answered),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: LSUColors.purple, // LSU purple button
                  foregroundColor: LSUColors.white, // White text on button
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  "Next Question",
                  style: TextStyle(
                    fontFamily: 'ProximaNova', // Using Proxima Nova font
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

Widget _getQuestionPage(int index, void Function(int) onAnswer, List<bool> answered) {
  final pages = [
    Question1Page(index: 0, onAnswer: onAnswer, answered: answered),
    Question2Page(index: 1, onAnswer: onAnswer, answered: answered),
    Question3Page(index: 2, onAnswer: onAnswer, answered: answered),
    Question4Page(index: 3, onAnswer: onAnswer, answered: answered),
    Question5Page(index: 4, onAnswer: onAnswer, answered: answered),
    Question6Page(index: 5, onAnswer: onAnswer, answered: answered),
    Question7Page(index: 6, onAnswer: onAnswer, answered: answered),
    Question8Page(index: 7, onAnswer: onAnswer, answered: answered),
    Question9Page(index: 8, onAnswer: onAnswer, answered: answered),
    Question10Page(index: 9, onAnswer: onAnswer, answered: answered),
  ];
  return pages[index];
}
