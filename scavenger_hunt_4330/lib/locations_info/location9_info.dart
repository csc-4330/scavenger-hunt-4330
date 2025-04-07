import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location9InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location9InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image9-min.png',
      text: "The Computer Science office in Patrick F. Taylor Hall is a central point for students in the program, providing academic resources, advising, and information about the latest developments in the field.",
      currentIndex: 8,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
