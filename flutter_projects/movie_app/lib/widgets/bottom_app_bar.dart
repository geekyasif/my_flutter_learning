import 'package:flutter/material.dart';
import 'package:movie_app/screens/now_playing.dart';
import 'package:movie_app/screens/top_rated.dart';
import 'package:movie_app/widgets/search.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _pagesData = [
    NowPlaying(),
    TopRated(),
  ];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          backgroundColor: Colors.red[600],
          title: Text("Movies Flix"),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: Icon(Icons.search))
          ]),
      body: Center(
        child: _pagesData[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red[600],
        backgroundColor: Colors.grey[900],
        // selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: "Now Playing"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outline), label: "Top Rated"),
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
