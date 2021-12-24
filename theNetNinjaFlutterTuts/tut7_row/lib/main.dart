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
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This is a Row",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Click Me"),
              color: Colors.amber,
            ),
            Container(
              child: Text("This is a paragraph"),
              padding: EdgeInsets.all(50.0),
              color: Colors.grey[400],
            )
          ],
        ));
  }
}
