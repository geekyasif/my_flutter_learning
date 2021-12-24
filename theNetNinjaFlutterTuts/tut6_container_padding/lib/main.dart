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
        // body: Container(
        //   child: Text("In container widget we can use color and margin property"),
        //   color: Colors.grey[400],
        //   // padding: EdgeInsets.all(10.0),
        //   // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        //   // padding: EdgeInsets.fromLTRB(10.0, 40.0, 20.0, 50.0)
        //   padding: EdgeInsets.only(top: 10.0),
        //   // margin: EdgeInsets.all(30.0),
        //   // margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        //   margin: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 50.0),
        // )

        body: Padding(
          child: Text(
              "In padding container we cannot use color and margin property"),
          padding: EdgeInsets.all(50.0),
          // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          // padding: EdgeInsets.fromLTRB(10.0, 40.0, 20.0, 50.0)
          // padding: EdgeInsets.only(top: 10.0),
        ));
  }
}
