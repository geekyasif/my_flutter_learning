import 'package:bca_notes/screens/admin/admin.dart';
import 'package:bca_notes/screens/notice/notice.dart';
import 'package:bca_notes/screens/syllabus/syllabus.dart';
import 'package:bca_notes/screens/timeTable/time_table.dart';
import 'package:bca_notes/screens/home/home.dart';
import 'package:bca_notes/widgets/drawer.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pagesData = [
    const Home(),
    const TimeTable(),
    const Syllabus(),
    const Notice(),
    const Admin(),
  ];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("BCA IU "),
      ),
      body: _pagesData[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Time Table"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: "Syllabus"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Notice"),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings), label: "Admin"),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue) {
          setState(() {
            _selectedItem = setValue;
          });
        },
      ),
      drawer: const DrawerNavBar(),
    );
  }
}
