import 'dart:async';
import 'package:flutter/material.dart';

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
    final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFF5F5DC), 
        brightness: Brightness.light,
      ),
    );

    final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF2E2E2E), // Matte grey.
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scavenger Hunt',
      themeMode: _themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Scavenger Hunt')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Scavenger Hunt!\n\n'
              'Find these locations and enter the vending machine code for this object at each location.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/hunt');
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}

class HintPage extends StatefulWidget {
  final String difficulty;
  const HintPage({super.key, required this.difficulty});
  
  @override
  HintPageState createState() => HintPageState();
}

class HintPageState extends State<HintPage> {
  final List<String> imagePaths =
      List.generate(10, (index) => 'assets/image${index + 1}.jpg');

  final List<String> prompts =
      List.generate(10, (index) => 'Enter code for image ${index + 1}:');

  final List<String> expectedAnswers = [
    'code1',
    'code2',
    'code3',
    'code4',
    'code5',
    'code6',
    'code7',
    'code8',
    'code9',
    'code10'
  ];

  int currentIndex = 0;
  final TextEditingController _controller = TextEditingController();
  bool isAnswerCorrect = false;

  Timer? _timer;
  int _timeLeft = 0; 

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  String get formattedTime {
    int minutes = _timeLeft ~/ 60;
    int seconds = _timeLeft % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  void startTimer() {
    if (widget.difficulty == "casual") {
      _timeLeft = 0;
      return;
    }
    _timeLeft = widget.difficulty == "hard" ? 60 : 300;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/lost');
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void nextPage() {
    cancelTimer();
    if (currentIndex < imagePaths.length - 1) {
      setState(() {
        currentIndex++;
        _controller.clear();
        isAnswerCorrect = false;
      });
      startTimer(); 
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  // Continuously check the user's input.
  void _checkAnswer(String value) {
    if (value.trim().toLowerCase() ==
        expectedAnswers[currentIndex].toLowerCase()) {
      if (!isAnswerCorrect) {
        setState(() {
          isAnswerCorrect = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted &&
              _controller.text.trim().toLowerCase() ==
                  expectedAnswers[currentIndex].toLowerCase()) {
            nextPage();
          }
        });
      }
    } else {
      setState(() {
        isAnswerCorrect = false;
      });
    }
  }

  @override
  void dispose() {
    cancelTimer();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final Color timerBorderColor = Theme.of(context).colorScheme.secondary;
    double progressValue = (currentIndex + 1) / imagePaths.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scavenger Hunt'),
        actions: [
          IconButton(
            icon: Icon(Icons.home), 
            onPressed: () {
              cancelTimer();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings), 
            onPressed: () {
              cancelTimer();
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            SizedBox(
              height: 4,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progressValue),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF46166B)),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Display the current image.
                  Image.asset(
                    imagePaths[currentIndex],
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  
                  if (widget.difficulty != "casual")
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: timerBorderColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Time Left: $formattedTime',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (widget.difficulty != "casual")
                    const SizedBox(height: 20),
                  // Prompt text.
                  Text(
                    prompts[currentIndex],
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  TextField(
                    controller: _controller,
                    onChanged: _checkAnswer,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your answer here',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final String difficulty;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onDifficultyChanged;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.difficulty,
    required this.onThemeChanged,
    required this.onDifficultyChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;
  late String _difficulty;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    _difficulty = widget.difficulty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.home), // Removed const so it uses the theme color.
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dark Mode toggle at the top.
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
                widget.onThemeChanged(value);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Difficulty:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Difficulty options as a list.
            RadioListTile<String>(
              title: const Text("Hard"),
              subtitle: const Text("1 minute timer"),
              value: "hard",
              groupValue: _difficulty,
              onChanged: (value) {
                setState(() {
                  _difficulty = value!;
                });
                widget.onDifficultyChanged(value!);
              },
            ),
            RadioListTile<String>(
              title: const Text("Medium"),
              subtitle: const Text("5 minute timer"),
              value: "medium",
              groupValue: _difficulty,
              onChanged: (value) {
                setState(() {
                  _difficulty = value!;
                });
                widget.onDifficultyChanged(value!);
              },
            ),
            RadioListTile<String>(
              title: const Text("Casual"),
              subtitle: const Text("No timer"),
              value: "casual",
              groupValue: _difficulty,
              onChanged: (value) {
                setState(() {
                  _difficulty = value!;
                });
                widget.onDifficultyChanged(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LostPage extends StatelessWidget {
  const LostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time's Up!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You lost!\nTime is up.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
