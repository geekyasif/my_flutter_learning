import 'package:flutter/material.dart';
import 'app_screens/table_screen.dart';

// creating tables in flutter

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "This is my app titile",
        home: Scaffold(
            appBar: AppBar(title: Text("This is status bar")),
            body: MyTable()));
  }
}
