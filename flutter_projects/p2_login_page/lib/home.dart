import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileLogo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          child: Image.asset('assets/logo.png'),
          radius: 60.0,
          backgroundColor: Colors.transparent,
        ));

    final bio = Text(
        "Flutter workshops are similar to the codelabs, but are instructor led and always use DartPad. The provided workshop link takes you to the relevant YouTube video, which tells you where to find the associated DartPad link.");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              profileLogo,
              SizedBox(height: 30.0),
              bio,
            ],
          ),
        ),
      ),
    );
  }
}
