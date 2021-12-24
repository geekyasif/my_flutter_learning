import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/logo.png'),
        ));

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final password = TextFormField(
      obscureText: true,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );

    final loginButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ))),
    );

    final forgotPassword = TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        child: Text("Forgot Password ?"));

    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(40.0),
          children: <Widget>[
            logo,
            SizedBox(height: 40.0),
            email,
            SizedBox(height: 10.0),
            password,
            SizedBox(
              height: 20.0,
            ),
            loginButton,
            SizedBox(
              height: 10.0,
            ),
            forgotPassword,
          ],
        ),
      ),
    );
  }
}
