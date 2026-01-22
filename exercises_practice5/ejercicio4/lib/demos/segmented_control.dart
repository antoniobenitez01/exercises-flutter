import 'package:flutter/cupertino.dart';

class SegmentedControlDemoPage extends StatefulWidget {
  const SegmentedControlDemoPage({super.key});

  @override
  State<SegmentedControlDemoPage> createState() =>
      _SegmentedControlDemoPageState();
}

class _SegmentedControlDemoPageState
    extends State<SegmentedControlDemoPage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Segmented Control'),
      ),
      child: Center(
        child: CupertinoSegmentedControl<int>(
          groupValue: _value,
          children: const {
            0: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('One'),
            ),
            1: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Two'),
            ),
            2: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Three'),
            ),
          },
          onValueChanged: (v) => setState(() => _value = v),
        ),
      ),
    );
  }
}
