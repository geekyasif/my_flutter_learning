import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("AppBar Using Scaffold"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("This is inside the body at center"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text("Click"),
      ),
    ),
  ));
}
