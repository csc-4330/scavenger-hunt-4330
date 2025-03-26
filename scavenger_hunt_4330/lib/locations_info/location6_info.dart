import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location6InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location6InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image6.jpg',
      text: "Panera Bread is a common student hangout spot with posted occupancy info.",
      currentIndex: 5,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
