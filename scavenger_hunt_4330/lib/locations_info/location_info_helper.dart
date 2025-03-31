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
      title: const Text(
        "Location Info",
        style: TextStyle(
          fontWeight: FontWeight.bold, // Make the title bold
        ),
      ),
      backgroundColor: LSUColors.purple, // LSU purple app bar
      centerTitle: true, // Center the title in the AppBar
    ),
    body: Container(
      color: LSUColors.lightGold, // LSU Light Gold background
      child: Column(
        mainAxisSize: MainAxisSize.max, // Ensure Column expands to fill available space
        children: [
          // Center the image properly with more padding on the sides
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0), // Adjust padding
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: LSUColors.purple, width: 4), // Bold purple border
                // No border radius (removing rounded corners)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.zero, // Ensuring no rounding of corners
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8), // Reduced space between image and text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Text container with purple border and light gold background
                  Container(
                    padding: const EdgeInsets.all(12), // Reduced padding inside the text container
                    decoration: BoxDecoration(
                      color: LSUColors.white,
                      border: Border.all(color: LSUColors.purple, width: 2), // Purple border
                      borderRadius: BorderRadius.circular(12), // Rounded corners for the text box
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 15, // Reduced font size for the text
                        fontWeight: FontWeight.normal, // Regular text weight
                        color: LSUColors.corporatePurple, // Changed text color to purple
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32), // Space before the button
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
