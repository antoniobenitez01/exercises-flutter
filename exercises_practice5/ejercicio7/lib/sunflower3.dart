import 'dart:math' as math;
import 'package:flutter/material.dart';

const int maxSeeds = 250;

class SunflowerPage3 extends StatefulWidget {
  const SunflowerPage3({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SunflowerState();
  }
}

class _SunflowerState extends State<SunflowerPage3> {
  int seeds = maxSeeds ~/ 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(elevation: 2),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Sunflower 4')),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SunflowerWidget(seeds)),
              const SizedBox(height: 20),
              Text('Showing ${seeds.round()} seeds'),
              SizedBox(
                width: 300,
                child: Slider(
                  min: 1,
                  max: maxSeeds.toDouble(),
                  value: seeds.toDouble(),
                  onChanged: (val) {
                    setState(() => seeds = val.round());
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

  const SunflowerWidget(this.seeds, {super.key});

  @override
  Widget build(BuildContext context) {
    final seedWidgets = <Widget>[];

    for (var i = 0; i < seeds; i++) {
      final theta = i * tau / phi;
      final r = math.sqrt(i) * scaleFactor;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(i),
          duration: Duration(milliseconds: rng.nextInt(500) + 250),
          curve: Curves.easeInOut,
          alignment: Alignment(r * math.cos(theta), -1 * r * math.sin(theta)),
          child: const Dot(true),
        ),
      );
    }

    int squareSeeds = maxSeeds - seeds;
    int side = (squareSeeds > 0) ? math.sqrt(squareSeeds.toDouble()).ceil() : 1;
    double scale = 0.75;

    for (var j = 0; j < squareSeeds; j++) {
      int row = j ~/ side;
      int col = j % side;

      double x = (side > 1) ? ((col / (side - 1)) * 2 - 1) * scale : 0.0;
      double y = (side > 1) ? ((row / (side - 1)) * 2 - 1) * scale : 0.0;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(j + seeds),
          duration: Duration(milliseconds: rng.nextInt(500) + 250),
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
        child: Stack(children: seedWidgets),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  static const size = 5.0;
  static const radius = 3.0;

  final bool lit;

  const Dot(this.lit, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lit ? Colors.lightGreenAccent : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const SizedBox(height: size, width: size),
    );
  }
}