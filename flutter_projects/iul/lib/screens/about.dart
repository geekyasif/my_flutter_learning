import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  Future share() {
    return Share.share('https://www.iulforum.tech/media/files/iulconnect.apk');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: const Text("About"),
        actions: [
          TextButton.icon(
            onPressed: () {
              share();
            },
            icon: const Icon(
              Icons.share,
              size: 18,
              color: Colors.white,
            ),
            label: const Text(
              "Share",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 90.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "IUL CONNECT",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "This app connects all the Integral University web links together.",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Don't forget to share with your friends 🙎‍♂️🙎 and also give us feedback 😊",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "More Features are coming soon 🚀",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Made with ❤ By "),
                  InkWell(
                      onTap: () => launch('https://geekyasif.github.io/'),
                      child: Text(
                        "Geekyasif",
                        style: TextStyle(color: Colors.amber[900]),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
