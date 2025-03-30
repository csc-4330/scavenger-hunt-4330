import 'package:flutter/material.dart';

class MapGallery extends StatelessWidget {
  const MapGallery({super.key});

  
  @override
  Widget build(BuildContext context) {
    final List<String> mapImages = [
      'assets/pft_floor1.png',
      'assets/pft_floor2.png',
      'assets/pft_floor3.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Building Maps",
          style: TextStyle(fontFamily: 'ProximaNova'),
        ),
      ),
      body: ListView.builder(
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  _DoubleTapZoomImage(imagePath: mapImages[index]),
                ],
              ),
            ),
          );
        },
      ),
     
      
    );
  }
}

class _DoubleTapZoomImage extends StatefulWidget {
  final String imagePath;
  const _DoubleTapZoomImage({required this.imagePath});

  @override
  State<_DoubleTapZoomImage> createState() => _DoubleTapZoomImageState();
}

class _DoubleTapZoomImageState extends State<_DoubleTapZoomImage> {
  final TransformationController _controller = TransformationController();
  TapDownDetails? _doubleTapDetails;
  bool _zoomed = false;

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    final position = _doubleTapDetails?.localPosition;
    if (position == null) return;

    if (!_zoomed) {
      _controller.value = Matrix4.identity()
        ..translate(position.dx, position.dy)
        ..scale(2.0)
        ..translate(-position.dx, -position.dy);
      _zoomed = true;
    } else {
      _controller.value = Matrix4.identity();
      _zoomed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: _handleDoubleTapDown,
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        transformationController: _controller,
        panEnabled: true,
        scaleEnabled: false,
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
