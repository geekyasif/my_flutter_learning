import 'package:flutter/material.dart';

// to use images from internet using url ( we use NetworkImage('url'))
// to use images from local directory we use ( Assets) first create assets directory and chaneg the pubsec.yaml file and uncomment assets command

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: Text("Box 1"),
              padding: EdgeInsets.all(10.0),
              color: Colors.red[400],
            ),
            Container(
              child: Text("Box2"),
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
            ),
            Container(
              child: Text("Box 3"),
              padding: EdgeInsets.all(50.0),
              color: Colors.yellow,
            ),
          ],
        ));
  }
}
