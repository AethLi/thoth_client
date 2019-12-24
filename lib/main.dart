import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MainWidget());

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  String thisTitle = "just name";

  static var globeThemeData = ThemeData(
    // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[800],
      backgroundColor: Colors.white,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.lightBlue[800],
      ));

  List<Widget> mainContent = <Widget>[
    Card(
      child: InkWell(
        splashColor: Colors.red,
        onTap: () {},
        child: Container(
          width: 300,
          height: 100,
          child: Center(
            child: Text('老虎机占位'),
          ),
        ),
      ),
    ),
    Divider(
      color: globeThemeData.primaryColor,
    ),
  ];

  _MainWidgetState(){
    _getLast5Lottery();
  }

  Future<Void> _getLast5Lottery() async {
//    sleep(Duration(seconds: 20));
    return Future.delayed(Duration(seconds: 5), () {
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
        drawer: MainDrawerWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: globeThemeData.backgroundColor,
            child: Icon(Icons.add, color: globeThemeData.primaryColor),
            onPressed: _onAdd),
        bottomNavigationBar: BottomAppBar(
          color: globeThemeData.backgroundColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home),
                color: globeThemeData.accentColor,
                onPressed: () {},
              ),
              SizedBox(),
              IconButton(
                icon: Icon(Icons.settings),
                color: globeThemeData.accentColor,
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
      theme: globeThemeData,
    );
  }

  void _onAdd() {}
}

class MainDrawerWidget extends StatelessWidget {
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
                children: <Widget>[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
