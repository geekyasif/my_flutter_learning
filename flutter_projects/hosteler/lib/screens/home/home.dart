import 'package:flutter/material.dart';
import 'package:hosteler/services/AuthServices.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ),
      ),
    );
  }
}
