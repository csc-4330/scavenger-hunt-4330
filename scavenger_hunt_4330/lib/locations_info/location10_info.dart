import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location10InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location10InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image10.jpg',
      text: "Patrick F. Taylor’s legacy lives on in the engineering program.",
      currentIndex: 9,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
