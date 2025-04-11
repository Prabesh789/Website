// presentation/animation/bubble_bg.dart
import 'dart:math';
import 'package:flutter/material.dart';

class BubbleBG extends StatefulWidget {
  final Widget child;
  const BubbleBG({super.key, required this.child});

  @override
  State<BubbleBG> createState() => _BubbleBGState();
}

class _BubbleBGState extends State<BubbleBG>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> _bubbles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    for (int i = 0; i < 2; i++) {
      _bubbles.add(Bubble());
    }
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
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: BubblePainter(_bubbles, _controller.value),
              size: MediaQuery.of(context).size,
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class Bubble {
  late double radius;
  late double x;
  late double y;
  late double speed;
  late double direction;
  final Random random = Random();

  Bubble() {
    radius = random.nextDouble() * 20 + 5;
    x = random.nextDouble();
    y = random.nextDouble();
    speed = random.nextDouble() * 0.001 + 0.0005;
    direction = random.nextDouble() * 2 * pi;
  }

  void update(double progress) {
    x += speed * cos(direction);
    y += speed * sin(direction);

    if (x < 0) x = 1;
    if (x > 1) x = 0;
    if (y < 0) y = 1;
    if (y > 1) y = 0;
  }
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;
  final double progress;

  BubblePainter(this.bubbles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()..color = Colors.blueGrey.withAlpha((0.2 * 255).toInt());

    for (final bubble in bubbles) {
      bubble.update(progress);
      canvas.drawCircle(
        Offset(bubble.x * size.width, bubble.y * size.height),
        bubble.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
