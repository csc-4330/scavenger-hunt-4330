import 'package:flutter/material.dart';
import 'lsu_colors.dart';
import 'home_tab.dart';
import 'questions_tab.dart';
import 'help_tab.dart';

// Question pages
import 'question_pages/question1_page.dart';
import 'question_pages/question2_page.dart';
import 'question_pages/question3_page.dart';
import 'question_pages/question4_page.dart';
import 'question_pages/question5_page.dart';
import 'question_pages/question6_page.dart';
import 'question_pages/question7_page.dart';
import 'question_pages/question8_page.dart';
import 'question_pages/question9_page.dart';
import 'question_pages/question10_page.dart';

void main() {
  runApp(const ScavengerHuntApp());
}

class ScavengerHuntApp extends StatelessWidget {
  const ScavengerHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      home: const MainScaffold(),
      routes: {
        '/question1': (context) => const Question1Page(),
        '/question2': (context) => const Question2Page(),
        '/question3': (context) => const Question3Page(),
        '/question4': (context) => const Question4Page(),
        '/question5': (context) => const Question5Page(),
        '/question6': (context) => const Question6Page(),
        '/question7': (context) => const Question7Page(),
        '/question8': (context) => const Question8Page(),
        '/question9': (context) => const Question9Page(),
        '/question10': (context) => const Question10Page(),
      },
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    QuestionsTab(),
    HelpTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: LSUColors.purple,
        unselectedItemColor: LSUColors.lightGray,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'Questions'),
          BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Help'),
        ],
      ),
    );
  }
}
