import 'package:flutter/material.dart';
import '/lsu_colors.dart'; 

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
        title: Text(
          "Question ${widget.index + 1}",
          style: TextStyle(
            fontFamily: 'ProximaNova', 
            fontWeight: FontWeight.bold, 
            fontSize: 20, 
          ),
        ),
        backgroundColor: LSUColors.purple,
        foregroundColor: LSUColors.white, 
        centerTitle: true,
      ),
      body: Container(
        color: LSUColors.lightGold, 
        width: double.infinity, 
        height: double.infinity, 
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              // Padding around the image for better spacing
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),  
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: LSUColors.purple, width: 4), 
                    borderRadius: BorderRadius.zero, 
                  ),
                  child: Image.asset(
                    widget.imagePath,
                    height: 350, 
                    fit: BoxFit.cover, 
                    width: double.infinity, 
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  widget.prompt,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ProximaNova', 
                    color: LSUColors.black, 
                    fontWeight: FontWeight.w600, 
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24), 
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12), 
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter your answer",
                    hintStyle: TextStyle(color: LSUColors.black.withOpacity(0.6)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), 
                      borderSide: BorderSide(color: LSUColors.purple, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24), 
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: LSUColors.purple,
                  foregroundColor: LSUColors.white, 
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
