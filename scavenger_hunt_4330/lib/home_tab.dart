import 'package:flutter/material.dart';
import 'lsu_colors.dart'; // Ensure LSU Colors are defined here (purple, gold, etc.)

class HomeTab extends StatelessWidget {
  final VoidCallback onStart;

  const HomeTab({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scavenger Hunt of PFT',
          style: TextStyle(
            fontFamily: 'ProximaNova', // Ensuring Proxima Nova is used
            fontSize: 30, // Increase font size for title
            fontWeight: FontWeight.bold, // Bold for better emphasis (no issues with rendering)
            color: Colors.white, // White text color for contrast
          ),
        ),
        backgroundColor: LSUColors.purple, // Apply LSU Purple to AppBar
        centerTitle: true, // Center the title
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/pft.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85), // Slightly less opacity for better readability
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Default shadow color (black)
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome to the PFT Scavenger Hunt!',
                    style: TextStyle(
                      fontFamily: 'ProximaNova', // Ensuring Proxima Nova is used here as well
                      fontSize: 30,
                      fontWeight: FontWeight.bold, // Bold text for heading
                      color: LSUColors.purple, // LSU Purple for headings
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Find the location of each of the pictures and enter the code to advance!',
                    style: TextStyle(
                      fontFamily: 'ProximaNova', // Ensuring Proxima Nova is used
                      fontSize: 18,
                      fontWeight: FontWeight.normal, // Lighter weight for body text
                      color: LSUColors.purple, // LSU Purple for subtext
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: onStart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LSUColors.purple, // Change button to LSU Purple
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Start Scavenger Hunt',
                      style: TextStyle(
                        fontFamily: 'ProximaNova', // Ensuring Proxima Nova is used
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: LSUColors.white, // White text for contrast
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
