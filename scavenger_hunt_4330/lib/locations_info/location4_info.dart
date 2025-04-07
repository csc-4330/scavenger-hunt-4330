import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location4InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location4InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image4.png',
      text: "The Capstone Stairs are an iconic part of the architectural design of the Patrick F. Taylor Hall, often serving as a striking feature that draws attention for both its functionality and aesthetic appeal.",
      currentIndex: 3,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
