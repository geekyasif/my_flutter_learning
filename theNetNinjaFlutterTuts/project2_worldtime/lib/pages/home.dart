import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("HElllwo");
    });

    await Future.delayed(Duration(seconds: 5), () {
      print("HElllwo");
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("World Time"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ignore: deprecated_member_use
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text("Choose Location"))
          ],
        ),
      ),
    );
  }
}
