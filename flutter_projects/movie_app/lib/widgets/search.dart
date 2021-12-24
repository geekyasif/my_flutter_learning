import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          backgroundColor: Colors.red[600],
          // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: Center(
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(2.0),
                    // prefixIcon: Icon(
                    //   Icons.search,
                    //   color: Colors.white,
                    // ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search here...',
                    border: InputBorder.none),
              ),
            ),
          )),
    );
  }
}
