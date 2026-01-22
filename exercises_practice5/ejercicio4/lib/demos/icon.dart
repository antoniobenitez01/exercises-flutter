import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/cupertino.dart';

class IconDemoPage extends StatelessWidget {
  const IconDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Icons'),
      ),
      child: Center(
        child: CNIcon(
          symbol: CNSymbol(
            'star.fill',
            size: 64,
            color: CupertinoColors.systemYellow,
          ),
        ),
      ),
    );
  }
}
