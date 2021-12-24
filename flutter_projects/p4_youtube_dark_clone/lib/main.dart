import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    title: "Youtube",
    home: Home(),
  ));
}
