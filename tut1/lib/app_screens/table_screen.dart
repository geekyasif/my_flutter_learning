import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      // creating container
      margin: EdgeInsets.all(10), // adding margin
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(children: [
            Text(
              "First Name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text("Last Name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
          ]),
          TableRow(children: [
            Text(
              "Mohammad",
              textAlign: TextAlign.center,
            ),
            Text(
              "Asif",
              textAlign: TextAlign.center,
            )
          ]),
          TableRow(children: [
            Text(
              "Mohammad",
              textAlign: TextAlign.center,
            ),
            Text(
              "haris",
              textAlign: TextAlign.center,
            )
          ]),
          TableRow(children: [
            Text(
              "Mohammad",
              textAlign: TextAlign.center,
            ),
            Text(
              "Shabaj Ansari",
              textAlign: TextAlign.center,
            )
          ])
        ],
      ),
    ));
  }
}
