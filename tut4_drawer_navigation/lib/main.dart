import 'dart:js';

import 'package:flutter/material.dart';

import 'aboutPage.dart';
import 'homePage.dart';
import 'settingPage.dart';

void main() {
  runApp(MaterialApp(title: "Drawer Navigation", home: MyDrawer()));
}

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDrawerState();
  }
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer Nvigation Demo")),
      body: Center(child: Text("Home page")),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://geekyasif.github.io/static/img/a.png"))),
                  ),
                  Text(
                    "Mohammad Asif",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            ListTile(
                title: Text("About"),
                leading: Icon(Icons.add_box),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                }),
            ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                }),
          ],
        ),
      ),
    );
  }
}
