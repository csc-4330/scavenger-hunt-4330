import 'package:flutter/material.dart';
import 'package:scavenger_hunt_4330/lsu_colors.dart'; // Update with actual path to LSUColors

class LSUBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const LSUBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: LSUColors.purple,
      unselectedItemColor: LSUColors.lightGray,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'Questions'),
        BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Help'),
      ],
    );
  }
}
