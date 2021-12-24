import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tut4_link_pages/SamplePageData.dart';

void main() {
  runApp(MaterialApp(
    title: "Navigation",
    home: MyNavigation(),
  ));
}

class MyNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyNavigationState();
  }
}

class _MyNavigationState extends State<MyNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
          // ignore: deprecated_member_use
          child: RaisedButton(
              child: Text("Click Here"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SamplePageData()));
              })),
    );
  }
}
