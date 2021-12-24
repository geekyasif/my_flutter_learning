import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Simple Form Title", home: SimpleForm()));
}

class SimpleForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleFormState();
  }
}

class _SimpleFormState extends State<SimpleForm> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Form")),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String username) {
                setState(() {
                  name = username;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Name is $name",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
