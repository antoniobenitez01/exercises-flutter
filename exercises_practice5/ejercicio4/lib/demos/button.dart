import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/cupertino.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Buttons'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CNButton(
              onPressed: () {},
              label: 'Primary Button',
            ),
            const SizedBox(height: 16),
            CNButton.icon(
              icon: const CNSymbol('heart'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
