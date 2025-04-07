import 'package:flutter/material.dart';
import 'lsu_colors.dart'; // Ensure LSU Colors are defined here (purple, gold, etc.)

class MapGallery extends StatelessWidget {
  const MapGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> mapImages = [
      'assets/pft_floor1q.PNG',
      'assets/pft_floor2q7.PNG',
      'assets/pft_floor3q.PNG',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Building Maps",
          style: TextStyle(
            fontFamily: 'ProximaNova',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: LSUColors.purple, // AppBar uses LSU purple
      ),
      body: Container(
        color: LSUColors.lightGold, // Set background to LSU Light Gold
        child: ListView.builder(
          itemCount: mapImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Floor ${index + 1}",
                      style: const TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: LSUColors.purple, // Text color matching the brand
                      ),
                    ),
                    const SizedBox(height: 10),
                    _FancyZoomableImage(imagePath: mapImages[index]), // Using the improved zoom widget
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FancyZoomableImage extends StatefulWidget {
  final String imagePath;

  const _FancyZoomableImage({required this.imagePath});

  @override
  _FancyZoomableImageState createState() => _FancyZoomableImageState();
}

class _FancyZoomableImageState extends State<_FancyZoomableImage> {
  final TransformationController _controller = TransformationController();
  bool _zoomed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _toggleZoom, // Double-tap to zoom in/out
      child: InteractiveViewer(
        transformationController: _controller,
        panEnabled: true, // Allow panning (dragging the image)
        scaleEnabled: true, // Enable pinch-to-zoom
        minScale: 1.0, // Minimum scale (default)
        maxScale: 4.0, // Maximum scale (zoom level)
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: LSUColors.purple, // Purple border for image outline
              width: 3.0, // 3px width for the outline
            ),
            borderRadius: BorderRadius.circular(16), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Subtle shadow
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16), // Rounded corners for image itself
            child: Image.asset(widget.imagePath),
          ),
        ),
      ),
    );
  }

  // Toggle between zoomed and normal state
  void _toggleZoom() {
    if (_zoomed) {
      _controller.value = Matrix4.identity(); // Reset to normal state
    } else {
      _controller.value = Matrix4.identity()..scale(2.0); // Zoom in at 2x scale
    }
    setState(() {
      _zoomed = !_zoomed;
    });
  }
}
