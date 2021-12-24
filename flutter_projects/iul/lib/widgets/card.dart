import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CustomCard({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150.0,
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        // color: Colors.white,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(4)), //border corner radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey, //color of shadow
              spreadRadius: 0.4, //spread radius
              blurRadius: 0.4, // blur radius
              offset: Offset(0, 1), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: 70.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            // ignore: prefer_const_constructors
            Text(name)
          ],
        ));
  }
}
