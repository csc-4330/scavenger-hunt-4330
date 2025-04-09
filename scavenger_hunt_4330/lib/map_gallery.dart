import 'package:flutter/material.dart';
import 'lsu_colors.dart'; 

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
        backgroundColor: LSUColors.purple, 
      ),
      body: Container(
        color: LSUColors.lightGold, 
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
                        color: LSUColors.purple, 
                      ),
                    ),
                    const SizedBox(height: 10),
                    _FancyZoomableImage(imagePath: mapImages[index]), 
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
      onDoubleTap: _toggleZoom, 
      child: InteractiveViewer(
        transformationController: _controller,
        panEnabled: true, 
        scaleEnabled: true, 
        minScale: 1.0, 
        maxScale: 4.0, 
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: LSUColors.purple, 
              width: 3.0, 
            ),
            borderRadius: BorderRadius.circular(16), 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), 
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16), 
            child: Image.asset(widget.imagePath),
          ),
        ),
      ),
    );
  }

  // Toggle between zoomed and normal state
  void _toggleZoom() {
    if (_zoomed) {
      _controller.value = Matrix4.identity(); 
    } else {
      _controller.value = Matrix4.identity()..scale(2.0);
    }
    setState(() {
      _zoomed = !_zoomed;
    });
  }
}
