import 'package:flutter/material.dart';
import 'package:hosteler/screens/auth/authenticate.dart';
import 'package:hosteler/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authenticate()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            }
          });
          return const CircularProgressIndicator();
        });
    // return const Text("wrapper");
  }
}
