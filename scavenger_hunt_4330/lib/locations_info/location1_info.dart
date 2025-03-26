import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location1InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location1InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image1.jpg',
      text: "The atrium was designed to be bright and collaborative with open light-filled spaces.",
      currentIndex: 0,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
