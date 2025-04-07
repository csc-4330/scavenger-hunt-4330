import 'package:flutter/material.dart';
import 'lsu_colors.dart'; // Ensure LSU Colors (purple, gold, etc.) are defined here

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
            fontFamily: 'ProximaNova',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFDD023),
          ),
        ),
        backgroundColor: LSUColors.purple,
        centerTitle: true,
      ),
      // Use LSU Yellow background
      backgroundColor: const Color(0xFFFDD023),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Extra space above the LSU logo
              const SizedBox(height: 0),
              
              // LSU logo, centered horizontally by the Column alignment
              Image.asset(
                'assets/lsu-min.png',
                height: 100,
                fit: BoxFit.contain,
              ),
              
              // Extra space below the LSU logo (equal to above to visually center between top and text)
              const SizedBox(height: 80),

              // Headline text
              const Text(
                'Welcome to the PFT Scavenger Hunt!',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: LSUColors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              // Description text
              const Text(
                'Find the location of each of the pictures and enter the code to advance!',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: LSUColors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Button
              ElevatedButton(
                onPressed: onStart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: LSUColors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                ),
                child: const Text(
                  'Start Scavenger Hunt',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: LSUColors.white,
                  ),
                ),
              ),

              // Add optional space below if desired
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
