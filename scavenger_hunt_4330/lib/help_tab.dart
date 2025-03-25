import 'package:flutter/material.dart';
import 'lsu_colors.dart';
import 'map_gallery.dart';

class HelpTab extends StatelessWidget {
  const HelpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text("View Building Maps"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MapGallery()),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "How to Play",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: LSUColors.purple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "1. Start the game from the Home tab.\n"
              "2. Go to the location in the picture.\n"
              "3. Enter your answer.\n"
              "4. Correct answers unlock the next question and reveal more info.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
