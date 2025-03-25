import 'package:flutter/material.dart';
import 'hint_page.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HintPage(difficulty: "hard"); // Or whatever your current setting is
  }
}
