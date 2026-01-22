import 'package:flutter/cupertino.dart';

class SwitchDemoPage extends StatefulWidget {
  const SwitchDemoPage({super.key});

  @override
  State<SwitchDemoPage> createState() => _SwitchDemoPageState();
}

class _SwitchDemoPageState extends State<SwitchDemoPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Switch'),
      ),
      child: Center(
        child: CupertinoSwitch(
          value: _value,
          onChanged: (v) => setState(() => _value = v),
        ),
      ),
    );
  }
}
