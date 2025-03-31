import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location8InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location8InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image8.jpg',
      text: "Professor Shepherd's office, located in the 3rd floor of the engineering building, is easily accessible to students. This is not to be confused with Daniel Shepherd's office, which is on the 2nd floor.",
      currentIndex: 7,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
