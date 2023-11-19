import 'dart:math';

import 'package:flutter/material.dart';

export "themes.dart";
export "spotify.dart";

Random rng = Random();

Color randomColor() {
  double hue = rng.nextDouble();
  double saturation = 0.4;
  double brightness = 0.85;
  return HSVColor.fromAHSV(1.0, hue * 360.0, saturation, brightness)
      .toColor();
}

List<Color> randomColors(int min, int max) {
  List<Color> colors = <Color>[];
  for
   (int i = 0; i < rng.nextInt(max - min) + min; i++) {
    colors.add(randomColor());
  }
  return colors;
}

T pickRandom<T>(List<T> elements) {
  return elements[rng.nextInt(elements.length)];
}
