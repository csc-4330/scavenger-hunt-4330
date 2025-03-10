import 'package:flutter/material.dart';
import 'home_page.dart';
import 'hint_page.dart';
import 'settings_page.dart';
import 'lost_page.dart';

void main() {
  runApp(const ScavengerHuntApp());
}

class ScavengerHuntApp extends StatefulWidget {
  const ScavengerHuntApp({super.key});

  @override
  State<ScavengerHuntApp> createState() => _ScavengerHuntAppState();
}

class _ScavengerHuntAppState extends State<ScavengerHuntApp> {
  ThemeMode _themeMode = ThemeMode.light;
  String _difficulty = "hard";

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changeDifficulty(String newDifficulty) {
    setState(() {
      _difficulty = newDifficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scavenger Hunt',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF5F5DC),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF2E2E2E),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/hunt': (context) => HintPage(difficulty: _difficulty),
        '/settings': (context) => SettingsPage(
              isDarkMode: _themeMode == ThemeMode.dark,
              difficulty: _difficulty,
              onThemeChanged: toggleTheme,
              onDifficultyChanged: changeDifficulty,
            ),
        '/lost': (context) => const LostPage(),
      },
    );
  }
}
