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
      text: "Panera Bread at LSU is a popular spot for students and faculty, offering a variety of delicious menu items. The commons outside provide an open space to enjoy food, unwind after class, or study with friends.",
      currentIndex: 5,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
