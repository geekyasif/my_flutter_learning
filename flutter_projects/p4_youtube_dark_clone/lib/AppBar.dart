import 'package:flutter/material.dart';

AppBar topAppBar = AppBar(
  backgroundColor: Colors.black,
  title: Image.asset(
    'assets/images/yt_logo_rgb_dark.png',
    width: 100.0,
  ),
  actions: [
    Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: Icon(Icons.cast_connected),
    ),
    Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: Icon(Icons.notifications),
    ),
    Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: Icon(Icons.search),
    ),
    Padding(
        padding: EdgeInsets.only(left: 25.0, right: 15.0),
        child: Icon(Icons.person)),
  ],
);

BottomAppBar bottomBar = BottomAppBar(
  color: Colors.grey[900],
  child: Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
    child: Container(
      height: 40.0,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.home),
              SizedBox(height: 4.0),
              Text("Home", style: TextStyle(fontSize: 10.0))
            ],
          ),
          Column(
            children: [
              Icon(Icons.whatshot),
              SizedBox(height: 4.0),
              Text("Shorts", style: TextStyle(fontSize: 10.0))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                size: 28.0,
              ),
              // SizedBox(height: 4.0),
              Text("", style: TextStyle(fontSize: 10.0))
            ],
          ),
          Column(
            children: [
              Icon(Icons.subscriptions),
              SizedBox(height: 4.0),
              Text("Subscription", style: TextStyle(fontSize: 10.0))
            ],
          ),
          Column(
            children: [
              Icon(Icons.library_books),
              SizedBox(height: 4.0),
              Text("Library", style: TextStyle(fontSize: 10.0))
            ],
          ),
        ],
      ),
    ),
  ),
);



//  backgroundColor: Colors.black87,
//   unselectedItemColor: Colors.white,
//   unselectedFontSize: 25.0,
//   selectedItemColor: Colors.white,
//   items: <BottomNavigationBarItem>[
//     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//     BottomNavigationBarItem(icon: , label: "Shorts"),
//     BottomNavigationBarItem(
//         icon: 
//         label: "a"),
//     BottomNavigationBarItem(
//         icon: label: "Subscriptions"),
//     BottomNavigationBarItem(icon:  label: "Library"),
//   ],