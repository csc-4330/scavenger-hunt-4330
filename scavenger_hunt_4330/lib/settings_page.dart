import 'package:flutter/material.dart';

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
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'ProximaNova'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text(
                "Dark Mode",
                style: TextStyle(fontFamily: 'ProximaNova'),
              ),
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
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            RadioListTile<String>(
              title: const Text(
                "Hard (1-minute timer)",
                style: TextStyle(fontFamily: 'ProximaNova'),
              ),
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
              title: const Text(
                "Medium (5-minute timer)",
                style: TextStyle(fontFamily: 'ProximaNova'),
              ),
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
              title: const Text(
                "Casual (No timer)",
                style: TextStyle(fontFamily: 'ProximaNova'),
              ),
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
