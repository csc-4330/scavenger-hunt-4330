import 'package:flutter/material.dart';
import 'lsu_colors.dart';

class QuestionsTab extends StatelessWidget {
  const QuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Example progress tracking array
    final List<bool> answered = List.generate(10, (index) => index < 3); // First 3 answered

    return Scaffold(
      appBar: AppBar(title: const Text("Questions")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final questionNumber = index + 1;
          final isAnswered = answered[index];

          return ListTile(
            title: Text("Question $questionNumber"),
            subtitle: Text(isAnswered ? "Answered" : "Locked"),
            leading: Icon(
              isAnswered ? Icons.check_circle : Icons.lock,
              color: isAnswered ? LSUColors.gold : LSUColors.mediumGray,
            ),
            enabled: isAnswered,
            onTap: isAnswered
                ? () {
                    // Navigate to hintTextMessage viewer
                    Navigator.pushNamed(context, '/question$questionNumber');
                  }
                : null,
          );
        },
      ),
    );
  }
}
