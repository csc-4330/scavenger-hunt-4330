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
              title: "Getting Started",
              body:
                  "Welcome to the LSU Scavenger Hunt App! Tap “Begin Your Adventure” on the home screen to start your journey around campus. Have fun, tiger!",
            ),
            _divider(),
            _helpSection(
              title: "Finding Clues",
              body:
                  "Use the image shown in each question to locate specific spots inside Patrick F. Taylor Hall. Explore carefully — the answer is right in front of you!",
            ),
            _divider(),
            _helpSection(
              title: "Submitting Answers",
              body:
                  "Once you find the location, type in your answer and tap 'Submit.' A correct answer will unlock the next challenge automatically.",
            ),
            _divider(),
            _helpSection(
              title: "Viewing Progress",
              body:
                  "Track your progress in the “Questions” tab. You'll see which questions you’ve completed and how many are left to conquer.",
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
