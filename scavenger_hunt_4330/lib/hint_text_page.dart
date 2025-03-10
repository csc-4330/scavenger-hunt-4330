import 'package:flutter/material.dart';

class HintTextPage extends StatelessWidget {
  final VoidCallback onContinue;
  final String hintTextMessage;
  final String imagePath;

  const HintTextPage({
    super.key,
    required this.onContinue,
    required this.hintTextMessage,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              imagePath, // ✅ Correct background image
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay for contrast
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.35), // ✅ Lighter overlay to show more background
            ),
          ),

          // Centered Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // ✅ Less padding to show more background
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text Container
                  Container(
                    padding: const EdgeInsets.all(16), // ✅ Reduced padding to make box smaller
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75), // ✅ More transparent box
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Hint Text - Smaller & Lighter
                        Text(
                          hintTextMessage,
                          style: const TextStyle(
                            fontSize: 16, // ✅ Smaller text for better background visibility
                            fontWeight: FontWeight.w500, // ✅ Slightly lighter weight
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20), // ✅ Reduced spacing

                        // Continue Button
                        ElevatedButton(
                          onPressed: onContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple, // ✅ Keep it purple
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 4,
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18, // ✅ Slightly smaller button text
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
