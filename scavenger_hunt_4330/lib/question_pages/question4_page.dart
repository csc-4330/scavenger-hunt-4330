import 'package:flutter/material.dart';
import '../lsu_colors.dart';

class Question4Page extends StatelessWidget {
  const Question4Page({super.key});

  final String question = "How many wooden steps are there in the capstone stairs?";
  final String locationInfo = "The Capstone Stairs are an iconic part of the architectural design of the Patrick F. Taylor Hall, often serving as a striking feature that draws attention for both its functionality and aesthetic appeal.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Question 4")),
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
                Image.asset('assets/image4.jpg'),
                const SizedBox(height: 20),
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
