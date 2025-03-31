import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location10InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location10InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image10.jpg',
      text: "Patrick F. Taylor, a key figure in the development of LSU's engineering school, was known for his generous contributions that helped shape the building and its programs into what they are today.",
      currentIndex: 9,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
