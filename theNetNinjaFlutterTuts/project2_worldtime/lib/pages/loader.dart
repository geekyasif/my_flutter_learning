import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:core';
// import 'package:project2_worldtime/api_data/world_time.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  String time = "Loading...";

  Future setupWorldTime() async {
    // WorldTime instance =
    //     WorldTime(location: 'Ballia', flag: 'a.jpg', url: '/Asia/Ballia');
    // await instance.getTime();
    // print(instance.time);
    String url = "http://worldtimeapi.org/api/timezone/Asia/Kolkata";
    http.Response response = await http.get(Uri.parse(url));

    Map data = json.decode(response.body);

    // get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(dateTime);
    // print(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);

    // set the time property

    time = now.toString();

    setState(() {
      time = time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
