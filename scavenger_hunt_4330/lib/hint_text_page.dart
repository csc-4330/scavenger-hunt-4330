import 'package:flutter/material.dart';

class HintTextPage extends StatelessWidget {
  final VoidCallback onContinue;

  const HintTextPage({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hint")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Good job! Here's a hint before the next challenge.",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onContinue,
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
