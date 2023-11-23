import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/bits.dart';

final class Scrubber_BackdropLineArt extends CustomPainter {
  static const double desiredSpacing = 34.0;
  static const double spacingMultiplier = 1.2;

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = desiredSpacing / spacingMultiplier;
    double point1 = size.width / 2 - strokeWidth / 2;
    double point2 = point1 + desiredSpacing;
    Paint paint = Paint()
      ..color = LaF.primary1
      ..strokeCap = StrokeCap.square
      ..strokeWidth = strokeWidth;
    canvas.drawLine(Offset(point1, 0), Offset(0, point1), paint);
    paint.color = LaF.primary2;
    canvas.drawLine(Offset(point2 + desiredSpacing, 0),
        Offset(0, point2 + desiredSpacing), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
