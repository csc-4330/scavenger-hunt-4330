import 'package:flutter/material.dart';
import 'lsu_colors.dart';
import 'home_tab.dart';
import 'questions_tab.dart';
import 'help_tab.dart';

void main() {
  runApp(const ScavengerHuntApp());
}

class ScavengerHuntApp extends StatefulWidget {
  const ScavengerHuntApp({super.key});

  @override
  State<ScavengerHuntApp> createState() => _ScavengerHuntAppState();
}

class _ScavengerHuntAppState extends State<ScavengerHuntApp> {
  int _currentTabIndex = 0;
  List<bool> answered = List.generate(10, (_) => false);
  int? currentQuestionIndex;

  void setTabIndex(int index) {
    if (index == 1) {
      // Pop all routes on the Questions stack back to root
      questionsNavigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
    setState(() {
      _currentTabIndex = index;
      if (_currentTabIndex == 1 && currentQuestionIndex == null) {
        currentQuestionIndex = null;
      }
    });
  }

  void markAnswered(int index) {
    setState(() {
      answered[index] = true;
      final next = answered.indexOf(false);
      if (next != -1 && next != index) {
        currentQuestionIndex = next;
      } else {
        currentQuestionIndex = null;
      }
    });
  }

  void openQuestion(int index) {
    setState(() => currentQuestionIndex = index);
  }

  void exitQuestion() {
    setState(() => currentQuestionIndex = null);
  }

  void startGame() {
    final next = answered.indexOf(false);
    if (next != -1) {
      setState(() {
        currentQuestionIndex = next;
        _currentTabIndex = 1;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        questionsNavigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (_) => QuestionsHomePage(
              answered: answered,
              onAnswer: markAnswered,
              onOpen: openQuestion,
              onBack: exitQuestion,
            ).getQuestionPage(next),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        useMaterial3: true,
        scaffoldBackgroundColor: LSUColors.white,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: LSUColors.purple,
          onPrimary: LSUColors.white,
          secondary: LSUColors.gold,
          onSecondary: LSUColors.black,
          error: Colors.red,
          onError: LSUColors.white,
          background: LSUColors.white,
          onBackground: LSUColors.black,
          surface: LSUColors.white,
          onSurface: LSUColors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: LSUColors.purple,
          foregroundColor: LSUColors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: LSUColors.purple,
            foregroundColor: LSUColors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentTabIndex,
          children: [
            HomeTab(onStart: startGame),
            QuestionsTab(
              answered: answered,
              currentQuestionIndex: currentQuestionIndex,
              onAnswer: markAnswered,
              onOpen: openQuestion,
              onBack: exitQuestion,
            ),
            const HelpTab(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          selectedItemColor: LSUColors.gold,
          unselectedItemColor: Colors.white,
          backgroundColor: LSUColors.purple,
          onTap: setTabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'Questions'),
            BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Help'),
          ],
        ),
      ),
    );
  }
}
