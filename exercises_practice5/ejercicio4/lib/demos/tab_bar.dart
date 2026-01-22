import 'package:flutter/cupertino.dart';

class TabBarDemoPage extends StatelessWidget {
  const TabBarDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(index == 0 ? 'Home' : 'Settings'),
          ),
          child: Center(
            child: Text(
              index == 0 ? 'Home Tab' : 'Settings Tab',
            ),
          ),
        );
      },
    );
  }
}
