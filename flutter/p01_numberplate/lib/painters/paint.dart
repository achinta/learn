import 'package:flutter/material.dart';
// import 'painters/object_detector_painter.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:camera/camera.dart';
import 'coordinates_translator.dart';

/// Draws a bounding box on canvas
class BoundingBoxPainter extends CustomPainter {
  final List<Rect> boundingBoxes;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;
  BoundingBoxPainter(this.boundingBoxes, this.imageSize, this.rotation,
      this.cameraLensDirection);

  Rect getRectFromBoundingBox(
    Rect bb,
    size,
  ) {
    final left =
        translateX(bb.left, size, imageSize, rotation, cameraLensDirection);
    final top = translateY(
      bb.top,
      size,
      imageSize,
      rotation,
      cameraLensDirection,
    );
    final right = translateX(
      bb.right,
      size,
      imageSize,
      rotation,
      cameraLensDirection,
    );
    final bottom = translateY(
      bb.bottom,
      size,
      imageSize,
      rotation,
      cameraLensDirection,
    );
    return Rect.fromLTRB(left, top, right, bottom);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    print('painting bounding boxes $boundingBoxes');
    for (Rect boundingBox in boundingBoxes) {
      canvas.drawRect(boundingBox, paint);
    }
    // canvas.drawRect(boundingBox, paint);

    // Rect bb = getRectFromBoundingBox(boundingBox, size);
    // canvas.drawRect(
    //   bb,
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RectanglePainter extends CustomPainter {
  List<Rect> boundinxBoxes;
  RectanglePainter(this.boundinxBoxes);

  @override
  void paint(Canvas canvas, Size size) {
    final bbPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final borderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    // print('drawing bounding box $boundingBox');
    // Rect boundingBox = Rect.fromLTWH(0, 0, 100, 100);
    for (Rect boundingBox in boundinxBoxes) {
      print('drawing bounding box $boundingBox');
      canvas.drawRect(boundingBox, bbPaint);
    }
    // draw border
    print('drawing border ${Rect.fromLTWH(0, 0, size.width, size.height)}');
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Takes an image and draws a bounding box around it
class BoundingBoxImage extends StatelessWidget {
  final Image image;
  final List<Rect> boundingBoxes;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  const BoundingBoxImage(
      {super.key,
      required this.image,
      required this.boundingBoxes,
      required this.imageSize,
      required this.rotation,
      required this.cameraLensDirection});

  @override
  Widget build(BuildContext context) {
    print('In BBImage painter');
    return CustomPaint(
      painter: BoundingBoxPainter(
          boundingBoxes, imageSize, rotation, cameraLensDirection),
      // child: image,
    );
  }
}
