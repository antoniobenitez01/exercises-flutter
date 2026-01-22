import 'dart:math' as math;
import 'package:flutter/material.dart';

const int maxSeeds = 250;

class SunflowerPage4 extends StatefulWidget {
  const SunflowerPage4({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SunflowerState();
  }
}

class _SunflowerState extends State<SunflowerPage4> {
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

    const petals = 12;
    const layers = 8;
    final t = seeds / maxSeeds;

    for (var i = 0; i < maxSeeds; i++) {

      double sx, sy;
      if (i < seeds) {
        final theta = i * tau / phi;
        final r = math.sqrt(i) * scaleFactor;
        sx = r * math.cos(theta);
        sy = -r * math.sin(theta);
      } else {
        final theta = tau * i / (maxSeeds - 1);
        sx = 0.9 * math.cos(theta);
        sy = 0.9 * math.sin(theta);
      }


      final layer = (i / petals).floor() + 1;
      final petalIndex = i % petals;
      final radius = layer / layers * 0.8;
      final angle = tau * petalIndex / petals;
      
      final flowerScale = 0.5;
      final fx = radius * math.cos(angle) * flowerScale;
      final fy = radius * math.sin(angle) * flowerScale;


      final x = sx * (1 - t) + fx * t;
      final y = sy * (1 - t) + fy * t;

      seedWidgets.add(
        AnimatedAlign(
          key: ValueKey(i),
          duration: Duration(milliseconds: rng.nextInt(300) + 200),
          curve: Curves.easeInOut,
          alignment: Alignment(x, y),
          child: Dot(i < seeds),
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
        color: lit ? Colors.yellowAccent : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: const SizedBox(height: size, width: size),
    );
  }
}