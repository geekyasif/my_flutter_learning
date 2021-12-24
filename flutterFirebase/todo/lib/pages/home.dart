import 'package:flutter/material.dart';
import 'add_data.dart';
import 'read_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud App"),
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddData()));
                },
                child: Text("Add Data")),
          ),
        ],
      ),
      body: ReadData(),
    );
  }
}
