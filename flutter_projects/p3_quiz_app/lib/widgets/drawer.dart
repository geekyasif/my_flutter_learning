import 'package:flutter/material.dart';

final drawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        child: Center(
          child: Text("Quiz app"),
        ),
        decoration: BoxDecoration(color: Colors.blue),
      ),
      ListTile(
        title: Text("Home"),
      ),
      ListTile(
        title: Text("Topics"),
      ),
      ListTile(
        title: Text("About"),
      ),
    ],
  ),
);
