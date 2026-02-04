import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedStarfield extends StatefulWidget {
  final int starCount;
  final double minStarSize;
  final double maxStarSize;
  final Color starColor;
  final Widget child;

  const AnimatedStarfield({
    super.key,
    this.starCount = 100,
    this.minStarSize = 1.0,
    this.maxStarSize = 3.0,
    this.starColor = Colors.white,
    required this.child,
  });

  @override
  State<AnimatedStarfield> createState() => _AnimatedStarfieldState();
}

class _AnimatedStarfieldState extends State<AnimatedStarfield>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Star> _stars;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _stars = List.generate(
      widget.starCount,
      (index) => Star(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size:
            widget.minStarSize +
            _random.nextDouble() * (widget.maxStarSize - widget.minStarSize),
        opacity: _random.nextDouble(),
        twinkleSpeed: 0.5 + _random.nextDouble() * 1.5,
        twinkleOffset: _random.nextDouble() * 2 * pi,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Starfield background
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: StarfieldPainter(
                  stars: _stars,
                  animationValue: _controller.value,
                  starColor: widget.starColor,
                ),
              );
            },
          ),
        ),
        // Content on top
        widget.child,
      ],
    );
  }
}

class Star {
  final double x; // Position as percentage (0.0 to 1.0)
  final double y; // Position as percentage (0.0 to 1.0)
  final double size;
  final double opacity;
  final double twinkleSpeed;
  final double twinkleOffset;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.twinkleSpeed,
    required this.twinkleOffset,
  });
}

class StarfieldPainter extends CustomPainter {
  final List<Star> stars;
  final double animationValue;
  final Color starColor;

  StarfieldPainter({
    required this.stars,
    required this.animationValue,
    required this.starColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final star in stars) {
      // Calculate twinkling effect using sine wave
      final twinkle = sin(
        (animationValue * 2 * pi * star.twinkleSpeed) + star.twinkleOffset,
      );

      // Map sine wave (-1 to 1) to opacity range (0.2 to 1.0)
      final currentOpacity = 0.2 + ((twinkle + 1) / 2) * 0.8;

      // Calculate actual position on canvas
      final dx = star.x * size.width;
      final dy = star.y * size.height;

      // Draw the star with glow effect
      paint.color = starColor.withOpacity(currentOpacity * star.opacity * 0.3);
      canvas.drawCircle(Offset(dx, dy), star.size * 2, paint);

      // Draw the core star
      paint.color = starColor.withOpacity(currentOpacity * star.opacity);
      canvas.drawCircle(Offset(dx, dy), star.size, paint);
    }
  }

  @override
  bool shouldRepaint(StarfieldPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
