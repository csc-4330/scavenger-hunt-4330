import 'package:flutter/material.dart';
import '/lsu_colors.dart'; // Ensure LSU Colors are defined here (purple, gold, etc.)

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
      appBar: AppBar(
        title: Text("Question ${widget.index + 1}", style: const TextStyle(fontFamily: 'ProximaNova')),
        backgroundColor: LSUColors.purple, // AppBar uses LSU purple
        foregroundColor: LSUColors.white, // White text for app bar
      ),
      body: Container(
        color: LSUColors.lightGold, // Set background to LSU Light Gold
        width: double.infinity, // Ensure the width is fully stretched
        height: double.infinity, // Ensure the height is fully stretched
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Ensures the content is centered
            children: [
              // Padding around the image for better spacing
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),  // Increased vertical padding
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: LSUColors.purple, width: 4), // Purple bold border
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12), // Ensure image respects the border radius
                    child: Image.asset(
                      widget.imagePath,
                      height: 350, // Increased image height for better visual impact
                      fit: BoxFit.cover, // Ensure the image covers the area
                      width: double.infinity, // Make the image take up the full width
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.prompt,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'ProximaNova', // Using Proxima Nova font
                  color: LSUColors.black, // Black text for contrast
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12), // Added horizontal padding
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter your answer",
                    hintStyle: TextStyle(color: LSUColors.black.withOpacity(0.6)), // Light hint text color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners for input field
                      borderSide: BorderSide(color: LSUColors.purple, width: 2), // Purple border
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: LSUColors.purple, // LSU purple button
                  foregroundColor: LSUColors.white, // White text for button
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (isCorrect == true)
                const Text(
                  "Correct!",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              if (isCorrect == false)
                const Text(
                  "Incorrect. Try again.",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
