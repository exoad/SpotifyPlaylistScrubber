import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify_playlist_scrubber/bits/bits.dart';

export 'app.dart';

export 'playlist_listview.dart';

Widget blurWidget({
  required Widget child,
  double sigmaX = 5.0,
  double sigmaY = 5.0,
}) {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: Container(
        color: Colors.transparent,
        child: child,
      ),
    ),
  );
}

Widget wrapTag(
        {required Widget child,
        required Color color,
        double innerPadding = 8.0}) =>
    Container(
        decoration: BoxDecoration(
            color: color, borderRadius: LaF.themeBorderRadius),
        child: Padding(
          padding: EdgeInsets.all(innerPadding),
          child: child,
        ));

Widget generateRandomGradient(
    [List<Color>? colors,
    double width = LaF.ARTWORK_LISTVIEW_SIZE,
    double height = LaF.ARTWORK_LISTVIEW_SIZE]) {
  colors ??= randomColors(2, 3);
  List<Alignment> alignments = <Alignment>[
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomRight
  ];
  Alignment begin = pickRandom(alignments);
  alignments.remove(begin);
  Alignment end = pickRandom(alignments);
  List<double> stops = <double>[];
  double step = 1.0 / (colors.length - 1);
  for (int i = 0; i < colors.length; i++) {
    stops.add(i * step);
  }
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: blurWidget(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: LaF.themeBorderRadius,
          gradient: LinearGradient(
              begin: begin, end: end, colors: colors, stops: stops),
        ),
      ),
    ),
  );
}
