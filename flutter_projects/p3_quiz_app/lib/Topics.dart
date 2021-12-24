import 'package:flutter/material.dart';
import 'package:p3_quiz_app/widgets/CustomCard.dart';

class Topics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          CustomCard("Geeky Asif",
              "https://images.pexels.com/photos/943096/pexels-photo-943096.jpeg?cs=srgb&dl=pexels-danny-meneses-943096.jpg&fm=jpg"),
          CustomCard("Flutter Basics",
              "https://images.pexels.com/photos/879109/pexels-photo-879109.jpeg?cs=srgb&dl=pexels-hitesh-choudhary-879109.jpg&fm=jpg"),
          CustomCard("JavaScript Basics",
              "https://images.pexels.com/photos/943096/pexels-photo-943096.jpeg?cs=srgb&dl=pexels-danny-meneses-943096.jpg&fm=jpg"),
          CustomCard("React Js",
              "https://images.pexels.com/photos/360591/pexels-photo-360591.jpeg?cs=srgb&dl=pexels-markus-spiske-360591.jpg&fm=jpg"),
        ]);
  }
}
