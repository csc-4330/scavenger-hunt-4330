import 'package:flutter/material.dart';

class HintTextPage extends StatelessWidget {
  final VoidCallback onContinue;
  final String hintTextMessage; // New parameter to accept the hint message

  const HintTextPage({super.key, required this.onContinue, required this.hintTextMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hint")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              hintTextMessage, // Display the custom message
              style: const TextStyle(fontSize: 20),
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
