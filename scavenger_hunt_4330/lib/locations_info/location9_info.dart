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
      imagePath: 'assets/image9.jpg',
      text: "The CS office in PFT offers advising and departmental resources.",
      currentIndex: 8,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
