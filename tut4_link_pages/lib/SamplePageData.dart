import 'package:flutter/material.dart';

class SamplePageData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("You are on another page"),
          FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      )),
    );
  }
}
