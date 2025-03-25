import 'package:flutter/material.dart';
import 'hint_page.dart';
import 'lsu_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No AppBar actions here — just a title
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        automaticallyImplyLeading: false, // prevents a back button or extra icon
      ),
      body: Stack(
        children: [
          // Optional background image
          Positioned.fill(
            child: Image.asset(
              'assets/pft.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: LSUColors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to the PFT Scavenger Hunt!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: LSUColors.purple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Explore Patrick F. Taylor Hall by solving questions tied to real locations. Each correct answer unlocks information about your surroundings and leads to the next stop.',
                    style: TextStyle(
                      fontSize: 16,
                      color: LSUColors.processBlack,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LSUColors.purple,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 32,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HintPage(difficulty: "hard"),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Scavenger Hunt",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
