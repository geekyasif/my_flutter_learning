import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "This is Expanded Widget",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded widgets are same like flexbox"),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Text("1"),
              color: Colors.amber,
              padding: EdgeInsets.all(30.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text("1"),
              color: Colors.red,
              padding: EdgeInsets.all(30.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text("1"),
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(30.0),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Text("4"),
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(30.0),
            ),
          ),
        ],
      ),
    );
  }
}
