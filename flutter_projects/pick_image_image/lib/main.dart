import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Image Picker',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const Home(),
  ));
}
