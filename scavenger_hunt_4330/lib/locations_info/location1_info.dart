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
      text: "The atrium of LSU's Patrick F. Taylor Hall was designed to create a spacious, open atmosphere with an emphasis on natural light. Large windows and skylights fill the space with light, promoting a collaborative and inviting environment. The modern design uses materials like concrete, glass, and steel to connect the indoors with the outdoors, reflecting the building's focus on innovation and connection.",
      currentIndex: 0,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
