import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Ninja Id Card",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Ninja Id Card"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('a.jpg'),
                  radius: 50.0,
                ),
              ),
              Divider(
                height: 90.0,
                color: Colors.grey[800],
              ),
              Text(
                "NAME",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 5.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                "Geeky Asif",
                style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 10.0,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "The Ninja Status",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 5.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                "4",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "geekyasif@gmail.com",
                      style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
