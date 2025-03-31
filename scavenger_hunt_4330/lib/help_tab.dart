import 'package:flutter/material.dart';
import 'lsu_colors.dart';
import 'map_gallery.dart';

class HelpTab extends StatelessWidget {
  const HelpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => const HelpHomePage(),
      ),
    );
  }
}

class HelpHomePage extends StatelessWidget {
  const HelpHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LSUColors.lightGold,
      appBar: AppBar(
        title: const Text(
          "Help",
          style: TextStyle(fontFamily: 'ProximaNova'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text(
                "View Building Maps",
                style: TextStyle(fontFamily: 'ProximaNova'),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const MapGallery()),
                );
              },
            ),
            const SizedBox(height: 24),
            _helpSection(
              title: "How to Begin",
              body:
                  "Tap “Start Scavenger Hunt” from the Home tab to start the scavenger hunt. Each clue will guide you through Patrick F. Taylor Hall!",
            ),
            _divider(),
            _helpSection(
              title: "Answering Clues",
              body:
                  "Once you reach a location, type in your answer in the box provided. Tap 'Submit' to check your answer and move on to the next challenge.",
            ),
            _divider(),
            _helpSection(
              title: "Tracking Your Progress",
              body:
                  "Use the 'Questions' tab to keep up with your completed challenges and see what’s still ahead.",
            ),
            _divider(),
            _helpSection(
              title: "Exploring the Building",
              body:
                  "Each clue comes with an image to help guide you. Use the photo hints to navigate to the right location inside the building.",
            ),
            _divider(),
            _helpSection(
              title: "Need More Help?",
              body:
                  "If you're unsure where to go, try checking the building map above! It'll help you get oriented and find your way.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpSection({required String title, required String body}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'ProximaNova',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LSUColors.purple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: const TextStyle(
              fontFamily: 'ProximaNova',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      thickness: 1,
      color: LSUColors.lightGray,
      height: 32,
    );
  }
}
