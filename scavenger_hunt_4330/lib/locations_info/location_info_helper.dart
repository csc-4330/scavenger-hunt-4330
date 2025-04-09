import 'package:flutter/material.dart';
import '/lsu_colors.dart'; 
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
      title: const Text(
        "Location Info",
        style: TextStyle(
          fontWeight: FontWeight.bold, 
        ),
      ),
      backgroundColor: LSUColors.purple,
      centerTitle: true, 
    ),
    body: Container(
      color: LSUColors.lightGold, 
      child: Column(
        mainAxisSize: MainAxisSize.max, 
        children: [
          // Center the image properly with more padding on the sides
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0), 
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: LSUColors.purple, width: 4), 
                // No border radius 
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.zero, 
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Text container with purple border and light gold background
                  Container(
                    padding: const EdgeInsets.all(12), 
                    decoration: BoxDecoration(
                      color: LSUColors.white,
                      border: Border.all(color: LSUColors.purple, width: 2), 
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.normal, 
                        color: LSUColors.corporatePurple, 
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32), 
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
                        backgroundColor: LSUColors.purple, 
                        foregroundColor: LSUColors.white, 
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        "Next Question",
                        style: TextStyle(
                          fontFamily: 'ProximaNova', 
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
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
