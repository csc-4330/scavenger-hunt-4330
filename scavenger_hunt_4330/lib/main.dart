import 'package:flutter/material.dart';
import 'lsu_colors.dart';
import 'home_tab.dart';
import 'questions_tab.dart';
import 'help_tab.dart';

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
      ),
      home: const MainScaffold(),
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

  final List<Widget> _tabs = [
    const HomeTab(),
    const QuestionsTab(),
    const HelpTab(),
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
