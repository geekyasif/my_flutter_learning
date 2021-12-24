import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  final String name;
  final String img;

  SubjectScreen(this.name, this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // color: Colors.grey[300],
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: this.name,
                      child: Image.asset(
                        this.img,
                        width: 150.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
