import 'package:flutter/material.dart';
import 'package:tut3_bottom_nav/sampleData.dart';

void main() {
  runApp(MaterialApp(title: "Bottom Navigation", home: BottomNavigation()));
}

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _pagesData = [HomePage(), AboutPage(), ServicesPage()];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Bar"),
      ),
      body: Center(
        child: _pagesData[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service), label: "Services"),
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
