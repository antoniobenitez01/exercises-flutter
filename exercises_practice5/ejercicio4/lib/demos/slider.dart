import 'package:flutter/cupertino.dart';

class SliderDemoPage extends StatefulWidget {
  const SliderDemoPage({super.key});

  @override
  State<SliderDemoPage> createState() => _SliderDemoPageState();
}

class _SliderDemoPageState extends State<SliderDemoPage> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Slider'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CupertinoSlider(
            value: _value,
            onChanged: (v) => setState(() => _value = v),
          ),
        ),
      ),
    );
  }
}
