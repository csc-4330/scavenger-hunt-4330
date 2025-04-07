import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location5InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location5InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image5-min.png',
      text: "Tau Beta Pi is the national engineering honor society, and the LSU chapter has a long history of honoring high-achieving engineering students, promoting the values of scholarship and service.",
      currentIndex: 4,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
