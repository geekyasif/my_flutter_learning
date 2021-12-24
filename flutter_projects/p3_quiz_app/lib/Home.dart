import 'package:flutter/material.dart';
import 'screens/About.dart';
import 'Topics.dart';
import 'screens/Profile.dart';
import 'widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _pageData = [Topics(), About(), Profile()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomNavigation = BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            label: "Topics",
            icon: Icon(
              Icons.home,
            )),
        BottomNavigationBarItem(
            label: "About",
            icon: Icon(
              Icons.info,
            )),
        BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
            )),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Topics"),
        backgroundColor: Colors.black,
      ),
      drawer: drawer,
      bottomNavigationBar: bottomNavigation,
      body: Center(
          child: Container(
        child: _pageData[_currentIndex],
        color: Colors.grey[800],
      )),
    );
  }
}
