import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location2InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location2InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image2.jpg',
      text: "The BASF lab supports chemical engineering experiments and student research.",
      currentIndex: 1,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
