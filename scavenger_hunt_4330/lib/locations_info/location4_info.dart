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
      imagePath: 'assets/image4.jpg',
      text: "The Capstone Stairs are an architectural focal point of PFT Hall.",
      currentIndex: 3,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
