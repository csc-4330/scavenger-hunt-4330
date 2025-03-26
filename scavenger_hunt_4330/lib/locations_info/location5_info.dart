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
      imagePath: 'assets/image5.jpg',
      text: "Tau Beta Pi is an engineering honor society, founded at LSU in 1936.",
      currentIndex: 4,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
