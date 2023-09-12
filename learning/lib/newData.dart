import 'dart:math';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatefulWidget {
  final double size;
  final int duration;

  CustomCircularProgress({
    this.size = 100.0,
    this.duration = 1500,
  });

  @override
  _CustomCircularProgressState createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double _currentValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _controller!.addListener(() {
      setState(() {
        _currentValue = _controller!.value;
      });
    });

    _controller!.repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: CustomCircularProgressPainter(
          progress: _currentValue,
        ),
      ),
    );
  }
}

class CustomCircularProgressPainter extends CustomPainter {
  final double progress;

  CustomCircularProgressPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.blue, Colors.green, Colors.blue],
        stops: [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: size.width / 2.0,
      ))
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width / 2.0,
    );

    final double sweepAngle = 2 * pi * progress;

    canvas.drawArc(rect, -pi / 2, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
