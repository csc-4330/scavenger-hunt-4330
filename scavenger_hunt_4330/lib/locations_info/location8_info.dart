import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location8InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location8InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image8.jpg',
      text: "Prof. Shepherd's office is on the 3rd floor — don’t mix it up!",
      currentIndex: 7,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
