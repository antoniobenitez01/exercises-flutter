import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RotatingWidget({
    super.key,
    required this.child,
    required this.duration,
  });

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(); // repeats infinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.1415926535, // full circle
          child: child,
        );
      },
    );
  }
}