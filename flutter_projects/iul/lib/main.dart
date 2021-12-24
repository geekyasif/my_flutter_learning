import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/about.dart';
import 'screens/home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IUL CONNECT",
      home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavigation())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/splashscreen.png')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pagesData = [Home(), const About()];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pagesData[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue) {
          setState(() {
            _selectedItem = setValue;
          });
        },
      ),
    );
  }
}
