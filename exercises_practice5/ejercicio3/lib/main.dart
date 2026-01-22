import 'package:ejercicio3/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoSimpleHomePage(),
    );
  }
}

class CupertinoSimpleHomePage extends StatefulWidget {
  const CupertinoSimpleHomePage({super.key});

  @override
  CupertinoSimpleHomePageState createState() =>
      CupertinoSimpleHomePageState();
}

class CupertinoSimpleHomePageState extends State<CupertinoSimpleHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Calls'),
                ),
                child: Center(child: Text('Calls'))
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoChatPage();
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoSettingsPage();
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}


class CupertinoChatPage extends StatefulWidget{
  const CupertinoChatPage({super.key});

  @override
  State<CupertinoChatPage> createState() => _CupertinoChatPageState();
}

class _CupertinoChatPageState extends State<CupertinoChatPage> {
  List<User> users = <User>[
    User('Jack', Colors.greenAccent),
    User('Lucy', Colors.green),
    User('Luna', Colors.black26),
    User('Oliver', Colors.blue),
    User('Lily', Colors.amberAccent),
    User('Milo', Colors.purple),
    User('Max', Colors.pink),
    User('Kitty', Colors.yellowAccent),
    User('Simba', Colors.red),
    User('Zoe', Colors.blueAccent),
    User('Jasper', Colors.deepOrange),
    User('Stella', Colors.cyan),
    User('Lola', Colors.lightBlue),
    User('Halsey', Colors.deepPurpleAccent),
    User('Taylor', Colors.indigoAccent),
  ];

  late List<User> _filteredUsers = users;
  final TextEditingController _controller = TextEditingController();

  void _updateUserList(String value) {
    debugPrint(value);

    if (value.isNotEmpty) {
      _filteredUsers = _filteredUsers
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _controller.text = '';
      _filteredUsers = users;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Chats'),
      ),
      child: CupertinoTabView(
      builder: (context) {
        return CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Chats'),
              leading: Text(
                'Edit',
                style: TextStyle(color: CupertinoColors.link),
              ),
              middle: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CupertinoActivityIndicator(),
                  SizedBox(width: 8),
                  Text('Waiting for network')
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ClipRect(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CupertinoSearchTextField(
                    controller: _controller,
                    onChanged: (value) {
                      _updateUserList(value);
                    },
                    onSubmitted: (value) {
                      _updateUserList(value);
                    },
                    onSuffixTap: () {
                      _updateUserList('');
                    },
                  ),
                )),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return UserTile(user: _filteredUsers[index]);
                },
                childCount: _filteredUsers.length,
              ),
            )
          ],
        );
      },
    )
    ); 
  }
}

class UserTile extends StatelessWidget{
  
  final User user;

  const UserTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: .all(20),
      color: Colors.white,
      child: Row(children: [
        CircleAvatar(backgroundColor: user.color),
        SizedBox(width: 10),
        Text(user.name)
      ],)
    );
  }
}

class CupertinoSettingsPage extends StatefulWidget{

  const CupertinoSettingsPage({super.key});

  @override
  State<CupertinoSettingsPage> createState() => _CupertinoSettingsPageState();
}

class _CupertinoSettingsPageState extends State<CupertinoSettingsPage> 
{

  bool chatBackup = false;
  DateTime date = DateTime.now();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: CupertinoFormSection(
          header: Text('Account Details'),
          children: [
            CupertinoFormRow(
              prefix: Text('Chat Backup'),
              child: CupertinoSwitch(
                value: chatBackup,
                onChanged: (value) {
                  setState(() {
                    chatBackup = !chatBackup;
                  });
                },
              ),
            ),
            Center(
              child: CupertinoButton(
                onPressed: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoActionSheet(
                      title: const Text('Set Wallpaper Theme'),
                      actions: <CupertinoActionSheetAction>[
                        CupertinoActionSheetAction(
                          child: const Text('Dark'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Light'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                },
                child: const Text('Chat Wallpaper'),
              ),
            ),
            Center(
              child: CupertinoButton(
                onPressed: () {
                  showCupertinoDialog<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Delete chat'),
                      content: const Text('Proceed with deleting chat?'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text('Yes'),
                          onPressed: () {
                            // Do something destructive.
                          },
                        )
                      ],
                    ),
                  );
                },
                child: const Text('Delete all chat'),
              ),
            ),
            Center(
              child: CupertinoButton(
                // Display a CupertinoDatePicker in date picker mode.
                onPressed: () => _showDialog(
                  CupertinoDatePicker(
                    backgroundColor: CupertinoColors.white,
                    initialDateTime: date,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => date = newDate);
                    },
                  ),
                ),
                // In this example, the date value is formatted manually. You can use intl package
                // to format the value based on user's locale settings.
                child: Text(
                  '${date.month}-${date.day}-${date.year}',
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}