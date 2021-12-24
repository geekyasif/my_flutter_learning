import 'dart:async';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:bca_notes/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BCA IU",
    home: SplashScreen(),
  ));
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
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomNavigation())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Column(
          // crossAxisAlignment:,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png'),
            // SizedBox(height: 10.0),
            const CircularProgressIndicator(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
