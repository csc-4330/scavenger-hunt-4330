import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location7InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location7InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image7.png',
      text: "The OTP- term refers to a unique part of LSU's distillery research area, where students and faculty explore cutting-edge chemical engineering processes.",
      currentIndex: 6,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
