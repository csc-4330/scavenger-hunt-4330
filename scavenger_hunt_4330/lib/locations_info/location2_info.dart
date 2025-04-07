import 'package:flutter/material.dart';
import 'location_info_helper.dart';

class Location2InfoPage extends StatelessWidget {
  final List<bool> answered;
  final void Function(int) onAnswer;

  const Location2InfoPage({super.key, required this.answered, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return buildLocationInfoPage(
      context: context,
      imagePath: 'assets/image2.png',
      text: "The BASF Lab in PFT is a research facility designed for students and faculty in the College of Engineering to conduct hands-on experiments and research in the field of chemical engineering. The lab is part of a partnership with BASF, a global chemical company, and is equipped with advanced technology and equipment to support research on chemical processes, sustainability, and other engineering innovations. It serves as a space for collaboration between university and industry, helping students gain practical experience.",
      currentIndex: 1,
      answered: answered,
      onAnswer: onAnswer,
    );
  }
}
