import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
      ),
    ),
    debugShowCheckedModeBanner: false,
    title: "Card Designing",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Card Designing"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/1229861/pexels-photo-1229861.jpeg?cs=srgb&dl=pexels-hasan-albari-1229861.jpg&fm=jpg",
                ),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Project Catalog",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Clear scope.",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2),
                ),
                Text(
                  "Upfront price.",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2),
                ),
                Text(
                  "No surpises.",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Complete your most pressing work with Project Catalog. Browse and buy predefined projects in just a few clicks.",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Try "video editing" or "data entry"',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.green[500],
                    ),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
