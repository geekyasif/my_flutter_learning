import 'package:flutter/material.dart';
import 'package:hosteler/screens/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/login.jpg',
            width: 300,
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
              // Respond to button press
            },
            icon: const Icon(Icons.login, size: 18),
            label: const Text("Login"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Respond to button press
            },
            icon: const Icon(Icons.app_registration, size: 18),
            label: const Text("Sign up"),
          )
        ],
      ),
    );
  }
}
