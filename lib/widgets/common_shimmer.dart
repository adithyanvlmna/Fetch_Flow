
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget? child;
  final Color? color;

  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.child,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
    direction: ShimmerDirection.fromLeftToRight(), // Corrected direction
        duration: const Duration(milliseconds: 1200),
        interval: const Duration(microseconds: 80),
        color: Colors.white,
        colorOpacity: 0.3,
        enabled: true,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color:color?? Colors.grey[200],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
