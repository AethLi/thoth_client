import 'package:flutter/material.dart';
import 'package:thoth_client/widget/slot.dart';

void main() => runApp(MainWidget());

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  String thisTitle = "最新公布开奖";
  static var activeNavigate = 0;
  static List<String> imageAssets0 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets1 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets2 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets3 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets4 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets5 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets6 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
  ];
  static List<String> imageAssets7 = [
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
    "images/number2b.png",
    "images/number3b.png",
    "images/number4b.png",
    "images/number5b.png",
    "images/number6b.png",
    "images/number7b.png",
    "images/number8b.png",
    "images/number9b.png",
    "images/number0b.png",
    "images/number1b.png",
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
//    _getLast5Lottery();
  }

//  Future<Void> _getLast5Lottery() async {
////    sleep(Duration(seconds: 20));
//    return Future.delayed(Duration(seconds: 0), () {
//      setState(() {
//        mainContent.add(ListTile(
//          title: Text("sfasasf"),
//        ));
//      });
//      return;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    mainContent = <Widget>[
      Card(
        child: Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets0, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets1, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets2, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets3, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets4, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets5, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets6, 60.0, 60.0, 100.0),
              ),
              Container(
                width: 60,
                height: 100,
                child: SlotWidget(imageAssets7, 60.0, 60.0, 100.0),
              ),
            ],
          ),
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
                    thisTitle = "最新公布开奖";
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
                    thisTitle = "历史购买记录";
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
                              "images/number0b.png",
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
                    title: const Text('首页'),
                    selected: activeNavigate == 0,
                    onTap: () {
                      activeNavigate = 0;
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.forum),
                    title: const Text('讨论'),
                    selected: activeNavigate == 1,
                    onTap: () {
                      activeNavigate = 1;
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('设置'),
                    selected: activeNavigate == 2,
                    onTap: () {
                      activeNavigate = 2;
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
