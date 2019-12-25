import 'dart:ffi';

import 'package:flutter/material.dart';

import 'widget/slot.dart';

void main() => runApp(MainWidget());

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget>
    with SingleTickerProviderStateMixin {
  String thisTitle = "just name";
  static var activeNavigate = 0;
  static List<String> imageAssets = [
    "images/number-0.png",
    "images/number-1.png",
    "images/number-2.png",
    "images/number-3.png",
    "images/number-4.png",
    "images/number-5.png",
    "images/number-6.png",
    "images/number-7.png",
    "images/number-8.png",
    "images/number-9.png"
  ];

  static var globeThemeData = ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.purple,
      backgroundColor: Colors.white,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.purple,
      ));

  List<Widget> mainContent;

  _MainWidgetState() {
    _getLast5Lottery();
  }

  Future<Void> _getLast5Lottery() async {

//    sleep(Duration(seconds: 20));
    return Future.delayed(Duration(seconds: 0), () {
      setState(() {
        mainContent.add(ListTile(
          title: Text("sfasasf"),
        ));
      });
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    mainContent = <Widget>[
      Card(
        child: Container(
          width: 300,
          height: 100,
          child: SlotWidget(imageAssets, 60.0, 60.0, this, 100.0),
        ),
      ),
      Divider(
        color: globeThemeData.primaryColor,
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            thisTitle,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
        ),
        body: ListView.builder(
          itemCount: mainContent.length,
          itemBuilder: (context, index) {
            return mainContent[index];
          },
        ),
        drawer: MainDrawerWidget(
          globeThemeData: globeThemeData,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: globeThemeData.backgroundColor,
            child: Icon(Icons.add, color: globeThemeData.primaryColor),
            onPressed: () {}),
        bottomNavigationBar: BottomAppBar(
          color: globeThemeData.backgroundColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.list),
                color: activeNavigate == 0
                    ? globeThemeData.primaryColor
                    : globeThemeData.accentColor,
                onPressed: () {
                  setState(() {
                    activeNavigate = 0;
                  });
                },
                tooltip: "最新公布开奖",
              ),
              SizedBox(),
              IconButton(
                icon: Icon(Icons.history),
                color: activeNavigate == 1
                    ? globeThemeData.primaryColor
                    : globeThemeData.accentColor,
                onPressed: () {
                  setState(() {
                    activeNavigate = 1;
                  });
                },
                tooltip: "历史购买记录",
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
      theme: globeThemeData,
    );
  }
}

class MainDrawerWidget extends StatelessWidget {
  final ThemeData globeThemeData;

  static var activeNavigate = 0;

  const MainDrawerWidget({Key key, @required this.globeThemeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ClipOval(
                            child: Image.asset(
                              "images/number-0.png",
                              width: 80.0,
                              height: 80.0,
                            ),
                          ),
                        ),
                        Text(
                          "未登录",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('主页'),
                    selected: activeNavigate == 0,
                    onTap: () {
                      activeNavigate = 0;
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('设置'),
                    selected: activeNavigate == 1,
                    onTap: () {
                      activeNavigate = 1;
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
