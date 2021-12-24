import 'package:flutter/material.dart';
import 'package:hosteler/screens/home/home.dart';
import 'package:hosteler/services/AuthServices.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthServices _auth = AuthServices();
  String email = "jlll";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                TextFormField(
                  initialValue: '',
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    errorText: 'Error message',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.error,
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: '',
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    errorText: 'Error message',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.error,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    // Respond to button press
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        print('Could not sign in with those credentials');
                      });
                    } else {
                      print(email);
                      print(password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (contex) => Home()));
                    }
                  },
                  icon: const Icon(Icons.login, size: 18),
                  label: const Text("Login"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    // Respond to button press
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        print('Could not sign in with those credentials');
                      });
                    } else {
                      print(email);
                      print(password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (contex) => Home()));
                    }
                  },
                  icon: const Icon(Icons.app_registration, size: 18),
                  label: const Text("Sign up"),
                ),
                Text(email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
