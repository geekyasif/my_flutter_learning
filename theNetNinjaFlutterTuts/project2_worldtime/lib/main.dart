import 'package:flutter/material.dart';
import 'package:project2_worldtime/pages/choose_location.dart';
import 'package:project2_worldtime/pages/home.dart';
import 'package:project2_worldtime/pages/loader.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loader(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
