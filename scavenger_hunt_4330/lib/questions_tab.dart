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

// Location Info pages should be imported here
import 'locations_info/location1_info.dart';
import 'locations_info/location2_info.dart';
import 'locations_info/location3_info.dart';
import 'locations_info/location4_info.dart';
import 'locations_info/location5_info.dart';
import 'locations_info/location6_info.dart';
import 'locations_info/location7_info.dart';
import 'locations_info/location8_info.dart';
import 'locations_info/location9_info.dart';
import 'locations_info/location10_info.dart';

final GlobalKey<NavigatorState> questionsNavigatorKey = GlobalKey<NavigatorState>();

class QuestionsTab extends StatelessWidget {
  final List<bool> answered;
  final int? currentQuestionIndex;
  final void Function(int index) onAnswer;
  final void Function(int index) onOpen;
  final VoidCallback onBack;

  const QuestionsTab({
    super.key,
    required this.answered,
    required this.currentQuestionIndex,
    required this.onAnswer,
    required this.onOpen,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: questionsNavigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => QuestionsHomePage(
          answered: answered,
          onAnswer: onAnswer,
          onOpen: onOpen,
          onBack: onBack,
        ),
      ),
    );
  }
}

class QuestionsHomePage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int index) onAnswer;
  final void Function(int index) onOpen;
  final VoidCallback onBack;

  const QuestionsHomePage({
    super.key,
    required this.answered,
    required this.onAnswer,
    required this.onOpen,
    required this.onBack,
  });

  Widget getQuestionPage(int index) {
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

  Widget _getLocationInfoPage(BuildContext context, int index) {
    final pages = [
      Location1InfoPage(answered: answered, onAnswer: onAnswer),
      Location2InfoPage(answered: answered, onAnswer: onAnswer),
      Location3InfoPage(answered: answered, onAnswer: onAnswer),
      Location4InfoPage(answered: answered, onAnswer: onAnswer),
      Location5InfoPage(answered: answered, onAnswer: onAnswer),
      Location6InfoPage(answered: answered, onAnswer: onAnswer),
      Location7InfoPage(answered: answered, onAnswer: onAnswer),
      Location8InfoPage(answered: answered, onAnswer: onAnswer),
      Location9InfoPage(answered: answered, onAnswer: onAnswer),
      Location10InfoPage(answered: answered, onAnswer: onAnswer),
    ];

    return Scaffold(
      body: pages[index], // Just display the location info page directly
    );
  }

  void _handleTap(BuildContext context, int index) {
    if (answered[index]) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => _getLocationInfoPage(context, index),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => getQuestionPage(index),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int answeredCount = answered.where((a) => a).length;
    int nextUnanswered = answered.indexOf(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Questions",
          style: TextStyle(fontFamily: 'ProximaNova'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "$answeredCount of 10 questions answered",
                  style: const TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: answeredCount / 10,
                  minHeight: 6,
                  backgroundColor: LSUColors.lightGray,
                  valueColor: const AlwaysStoppedAnimation<Color>(LSUColors.gold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final isAnswered = answered[index];
                final isNext = index == nextUnanswered;
                final isUnlocked = isAnswered || isNext;

                return Card(
                  color: isUnlocked
                      ? LSUColors.white
                      : LSUColors.lightGray.withOpacity(0.3),
                  child: ListTile(
                    title: Text(
                      "Question ${index + 1}",
                      style: const TextStyle(fontFamily: 'ProximaNova'),
                    ),
                    subtitle: Text(
                      isAnswered
                          ? "Answered"
                          : isUnlocked
                              ? "Ready to solve"
                              : "Locked",
                      style: const TextStyle(fontFamily: 'ProximaNova'),
                    ),
                    enabled: isUnlocked,
                    onTap: () => _handleTap(context, index),
                    leading: Icon(
                      isAnswered
                          ? Icons.check_circle
                          : isUnlocked
                              ? Icons.lock_open
                              : Icons.lock,
                      color: isAnswered
                          ? LSUColors.gold
                          : LSUColors.mediumGray,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
