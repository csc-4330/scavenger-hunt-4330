import 'package:flutter/material.dart';
import '../lsu_colors.dart';

class Question10Page extends StatelessWidget {
  const Question10Page({super.key});

  final String question = "What year did Patrick F. Taylor pass away?";
  final String locationInfo = "Patrick F. Taylor, a key figure in the development of LSU’s engineering school, was known for his generous contributions that helped shape the building and its programs into what they are today.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Question 10")),
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
                Image.asset('assets/image10.jpg'),
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
