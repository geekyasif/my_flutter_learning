import 'package:flutter/material.dart';
import 'package:p3_quiz_app/screens/quiz.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String url;

  DetailScreen(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Hero(
                  tag: this.title,
                  child: Image.network(
                    this.url,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quiz()));
                  },
                  child: Text("Start Quiz"),
                ),
              ),
            )
          ],
        ));
  }
}
