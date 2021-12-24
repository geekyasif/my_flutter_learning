import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SubjectScreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget subject(String name, String img) {
      return Container(
        // color: Colors.white,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey,
          width: 0.3,
          style: BorderStyle.solid,
        )),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubjectScreen(name, img)));
              },
              child: Hero(
                tag: name,
                child: Image.asset(
                  img,
                  width: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cbse Class 12 Notes"),
        centerTitle: true,
      ),
      body: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(5.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: [
          subject("Physics", "assets/images/physics.png"),
          subject("Mathematics", "assets/images/math.png"),
          subject("Chemistry", "assets/images/chemistry.png"),
          subject("Biology", "assets/images/bio.png"),
          subject("English", "assets/images/en.png"),
          subject("Hindi", "assets/images/en.png"),
          subject("Computer Science", "assets/images/cs.png"),
          subject("Information Technology", "assets/images/it.png"),
          subject("Business Study", "assets/images/business.png"),
          subject("Accountancy", "assets/images/account.png"),
          subject("Economics", "assets/images/economics.png"),
          subject("History", "assets/images/history.png"),
          subject("Geography", "assets/images/geography.png"),
          subject("Political Science", "assets/images/polsci.png"),
          subject("Physical Education", "assets/images/phyedu.png"),
          subject("Psychology", "assets/images/psycho.png"),
          subject("Sociology", "assets/images/sociology.png"),
        ],
      ),
    );
  }
}
