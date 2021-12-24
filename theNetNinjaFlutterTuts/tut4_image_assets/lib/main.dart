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
        // child: Image.asset('assets/img1.jpg'),
        // or
        child: Image.network(
            'https://images.unsplash.com/photo-1628530469276-ec56f8fc34c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        // or
        // child: Image(
        // child: Imagnetwork(src)(
        //     'https://images.unsplash.com/photo-1628530469276-ec56f8fc34c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        // image: AssetImage('assets/img1.jpg')),
      ),
    );
  }
}
