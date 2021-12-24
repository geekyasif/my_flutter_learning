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
        body: Center(

            // child: Icon(            // adding icons that is not clickable
            //   Icons.access_alarm,
            //   color: Colors.deepOrangeAccent,
            //   size: 50,
            // ),

            //     child: RaisedButton(   // simple buttons with shadow
            //   onPressed: () {},
            //   child: Text(
            //     "Click me",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   color: Colors.red,
            // )

            //     child: FlatButton(  // simple buttons without shadow
            //   onPressed: () {},
            //   child: Text(
            //     "Click me",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   color: Colors.red,
            // )),

            //     child: RaisedButton.icon(  // adding icons to the buttons
            //   onPressed: () {},
            //   icon: Icon(Icons.mail),
            //   label: Text("Gmail"),
            //   color: Colors.orange,

            // )

            child: IconButton(
          // onlyshow icon and its clickable
          onPressed: () {},
          icon: Icon(Icons.mail),
          color: Colors.orange,
        )));
  }
}
