import 'package:bca_notes/screens/home/subject.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget card(String sem, String imgUrl) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: const BorderRadius.all(Radius.circular(5.0))),
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Subject(sem: sem, imgUrl: imgUrl)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: sem,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  )),
              // const SizedBox(
              //   height: 30.0,
              // ),
              // Container(
              //   padding: EdgeInsets.only(left: 6.0),
              //   child: Text(
              //     sem,
              //     style: const TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,
              //         fontWeight: FontWeight.w600,
              //         letterSpacing: 1),
              //   ),
              // )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 1;

    return GridView.count(
      shrinkWrap: true,
      // childAspectRatio: 1.0,
      childAspectRatio: (3 / 1.69),
      padding: const EdgeInsets.all(20.0),
      crossAxisCount: 1,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 10.0,
      children: [
        card("Semester 1", "assets/images/sem1.png"),
        card("Semester 2", "assets/images/sem2.png"),
        card("Semester 3", "assets/images/sem3.png"),
        card("Semester 4", "assets/images/sem4.png"),
        card("Semester 5", "assets/images/sem5.png"),
        card("Semester 6", "assets/images/sem6.png"),
      ],
    );
  }
}
