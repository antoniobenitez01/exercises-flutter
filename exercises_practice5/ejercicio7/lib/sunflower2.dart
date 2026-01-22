import 'dart:math' as math;
import 'package:flutter/material.dart';

const int maxSeeds = 500;

class SunflowerPage2 extends StatefulWidget {
  const SunflowerPage2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SunflowerState();
  }
}

class _SunflowerState extends State<SunflowerPage2> {
  int seeds = maxSeeds;
  int rotation = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(elevation: 2),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Sunflower 2')),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: .center,
            children: [
              Expanded(child: SunflowerWidget(seeds, rotation)),
              const SizedBox(height: 20),
              Text('Showing ${seeds.round()} seeds'),
              SizedBox(
                width: 300,
                child: Slider(
                  min: 0,
                  max: 360,
                  value: rotation.toDouble(),
                  onChanged: (val) {
                    setState(() => rotation = val.round());
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SunflowerWidget extends StatelessWidget {
  static const tau = math.pi * 2;
  static const scaleFactor = 1 / 40;
  static const size = 600.0;
  static final phi = (math.sqrt(5) + 1) / 2;
  static final rng = math.Random();

  final int seeds;
  final int rotation;

  const SunflowerWidget(this.seeds, this.rotation, {super.key});

  @override
  Widget build(BuildContext context) {
    final seedWidgets = <Widget>[];

    final rotationRadians = rotation * math.pi / 180;
    final spreadFactor = 1 + rotation / 360;

    for (var i = 0; i < seeds; i++) {
      final theta = i * tau / phi;
      final r = math.sqrt(i) * scaleFactor * spreadFactor;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(i),
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: Alignment(r * math.cos(theta), -r * math.sin(theta)),
          child: const Dot(true),
        ),
      );
    }

    for (var j = seeds; j < maxSeeds; j++) {
      final x = math.cos(tau * j / (maxSeeds - 1)) * 0.9 * spreadFactor;
      final y = math.sin(tau * j / (maxSeeds - 1)) * 0.9 * spreadFactor;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(j),
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: Alignment(x, y),
          child: const Dot(false),
        ),
      );
    }

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        height: size,
        width: size,
        child: Transform.rotate(
          angle: rotationRadians / 4,
          child: Stack(children: seedWidgets)
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  static const size = 5.0;
  static const radius = 10.0;

  final bool lit;

  const Dot(this.lit, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lit ? Colors.cyanAccent : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const SizedBox(height: size, width: size),
    );
  }
}