import 'package:flutter/material.dart';
import '../screens/detailScreen.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String url;

  CustomCard(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(this.title, this.url);
              }));
            },
            child: Hero(
                tag: this.title,
                child: Image(
                  image: NetworkImage(this.url),
                  // fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              this.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          )
        ],
      ),
    );
  }
}
