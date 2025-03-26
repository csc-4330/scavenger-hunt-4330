import 'package:flutter/material.dart';

class QuestionPageTemplate extends StatefulWidget {
  final int index;
  final String prompt;
  final String correctAnswer;
  final String imagePath;
  final VoidCallback onCorrect;

  const QuestionPageTemplate({
    super.key,
    required this.index,
    required this.prompt,
    required this.correctAnswer,
    required this.imagePath,
    required this.onCorrect,
  });

  @override
  State<QuestionPageTemplate> createState() => _QuestionPageTemplateState();
}

class _QuestionPageTemplateState extends State<QuestionPageTemplate> {
  final TextEditingController _controller = TextEditingController();
  bool? isCorrect;

  void _submit() {
    final input = _controller.text.trim().toLowerCase();
    final answer = widget.correctAnswer.toLowerCase();

    setState(() {
      isCorrect = input == answer;
    });

    if (input == answer) {
      Future.delayed(const Duration(milliseconds: 800), widget.onCorrect);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Question ${widget.index + 1}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(widget.imagePath, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 24),
            Text(widget.prompt, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter your answer",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submit, child: const Text("Submit")),
            const SizedBox(height: 12),
            if (isCorrect == true)
              const Text("Correct!", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            if (isCorrect == false)
              const Text("Incorrect. Try again.", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
