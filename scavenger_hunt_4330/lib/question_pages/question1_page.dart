import 'package:flutter/material.dart';
import '/lsu_colors.dart';

class Question1Page extends StatelessWidget {
  const Question1Page({super.key});

  final String question = "What in the binary number that is written on the left wall of the atrium?";
  final String locationInfo = "The atrium of LSU’s Patrick F. Taylor Hall was designed to create a spacious, open atmosphere with an emphasis on natural light. Large windows and skylights fill the space with light, promoting a collaborative and inviting environment. The modern design uses materials like concrete, glass, and steel to connect the indoors with the outdoors, reflecting the building's focus on innovation and connection.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Question 1")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          color: LSUColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: LSUColors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  locationInfo,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
