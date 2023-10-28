import 'package:flutter/material.dart';

class BoundingBoxPainter extends CustomPainter {
  final Rect boundingBox;
  BoundingBoxPainter(this.boundingBox);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(boundingBox, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BoundingBoxImage extends StatelessWidget {
  final ImageProvider imageProvider;
  final Rect boundingBox;

  const BoundingBoxImage(
      {super.key, required this.imageProvider, required this.boundingBox});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BoundingBoxPainter(boundingBox),
      child: Image(image: imageProvider),
    );
  }
}
