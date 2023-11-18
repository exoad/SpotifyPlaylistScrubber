import 'package:flutter/material.dart';

class SmoothDelayScrollPhysics extends ScrollPhysics {
  final double delay;
  final double softness;

  const SmoothDelayScrollPhysics(
      {ScrollPhysics? parent,
      required this.delay,
      required this.softness})
      : super(parent: parent);

  @override
  SmoothDelayScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SmoothDelayScrollPhysics(
      parent: buildParent(ancestor),
      delay: delay,
      softness: softness,
    );
  }

  @override
  double applyPhysicsToUserOffset(
      ScrollMetrics position, double offset) {
    final double delayedOffset = offset * delay;
    final double softOffset = delayedOffset +
        softness * (1.0 - 1.0 / (1.0 + offset / softness));
    return super.applyPhysicsToUserOffset(position, softOffset);
  }
}
