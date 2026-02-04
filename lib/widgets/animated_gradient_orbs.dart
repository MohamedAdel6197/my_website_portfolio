import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedGradientOrbs extends StatefulWidget {
  final int orbCount;
  final Widget child;

  const AnimatedGradientOrbs({
    super.key,
    this.orbCount = 5,
    required this.child,
  });

  @override
  State<AnimatedGradientOrbs> createState() => _AnimatedGradientOrbsState();
}

class _AnimatedGradientOrbsState extends State<AnimatedGradientOrbs>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Orb> _orbs;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      widget.orbCount,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 15 + _random.nextInt(15), // 15-30 seconds
        ),
      )..repeat(),
    );

    _orbs = List.generate(
      widget.orbCount,
      (index) => Orb(
        startX: _random.nextDouble(),
        startY: _random.nextDouble(),
        endX: _random.nextDouble(),
        endY: _random.nextDouble(),
        size: 200 + _random.nextDouble() * 300, // 200-500
        color: _getRandomColor(index),
        blur: 80 + _random.nextDouble() * 40, // 80-120
      ),
    );
  }

  Color _getRandomColor(int index) {
    final colors = [
      const Color(0xFF6366F1).withOpacity(0.15), // Indigo
      const Color(0xFF8B5CF6).withOpacity(0.15), // Purple
      const Color(0xFFEC4899).withOpacity(0.15), // Pink
      const Color(0xFF3B82F6).withOpacity(0.15), // Blue
      const Color(0xFF06B6D4).withOpacity(0.15), // Cyan
    ];
    return colors[index % colors.length];
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Orbs background
        Positioned.fill(
          child: ClipRect(
            child: AnimatedBuilder(
              animation: Listenable.merge(_controllers),
              builder: (context, child) {
                return CustomPaint(
                  painter: OrbsPainter(orbs: _orbs, controllers: _controllers),
                );
              },
            ),
          ),
        ),
        // Content on top
        widget.child,
      ],
    );
  }
}

class Orb {
  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final double size;
  final Color color;
  final double blur;

  Orb({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    required this.size,
    required this.color,
    required this.blur,
  });
}

class OrbsPainter extends CustomPainter {
  final List<Orb> orbs;
  final List<AnimationController> controllers;

  OrbsPainter({required this.orbs, required this.controllers});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < orbs.length; i++) {
      final orb = orbs[i];
      final progress = controllers[i].value;

      // Calculate current position using smooth easing
      final t = _easeInOutSine(progress);
      final currentX = lerpDouble(orb.startX, orb.endX, t)! * size.width;
      final currentY = lerpDouble(orb.startY, orb.endY, t)! * size.height;

      // Create gradient for the orb
      final paint = Paint()
        ..shader =
            RadialGradient(
              colors: [
                orb.color.withOpacity(orb.color.opacity * 0.8),
                orb.color.withOpacity(orb.color.opacity * 0.4),
                orb.color.withOpacity(0),
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(
              Rect.fromCircle(
                center: Offset(currentX, currentY),
                radius: orb.size / 2,
              ),
            )
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, orb.blur);

      // Draw the orb
      canvas.drawCircle(Offset(currentX, currentY), orb.size / 2, paint);
    }
  }

  double _easeInOutSine(double t) {
    return -(cos(pi * t) - 1) / 2;
  }

  @override
  bool shouldRepaint(OrbsPainter oldDelegate) => true;
}
