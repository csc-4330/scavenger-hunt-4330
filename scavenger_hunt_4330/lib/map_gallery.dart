import 'package:flutter/material.dart';

class MapGallery extends StatelessWidget {
  const MapGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> mapImages = [
      'assets/floor1.png',
      'assets/floor2.png',
      'assets/floor3.png',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Building Maps")),
      body: ListView.builder(
        itemCount: mapImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Floor ${index + 1}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10),
                Image.asset(mapImages[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
