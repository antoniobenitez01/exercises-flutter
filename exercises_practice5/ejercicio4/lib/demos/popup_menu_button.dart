import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/cupertino.dart';

class PopupMenuButtonDemoPage extends StatelessWidget {
  const PopupMenuButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Popup Menu Button'),
      ),
      child: Center(
        child: CNPopupMenuButton(
          buttonLabel: 'Open Menu',
          items: const [
            CNPopupMenuItem(label: 'First'),
            CNPopupMenuItem(label: 'Second'),
            CNPopupMenuItem(label: 'Third'),
          ],
          onSelected: (index) {
            // demo only
          },
        ),
      ),
    );
  }
}
