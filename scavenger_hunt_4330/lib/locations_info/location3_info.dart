import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location3InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location3InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image3.jpg',
      text: "The sponsor wall in Patrick F. Taylor Hall recognizes the contributions of companies and organizations that support LSU's engineering programs, with banners prominently displaying their names.",
      currentIndex: 2,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
