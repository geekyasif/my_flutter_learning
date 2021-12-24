// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:core';

// class WorldTime {
//   String location;
//   String flag;
//   String url;
//   String time = '';

//   WorldTime({this.location, this.flag, this.url});

//   Future getTime() async {
//     http.Response response =
//         await http.get("http://worldtimeapi.org/api/timezone/");
//     Map data = jsonDecode(response.body);

//     // get properties from data
//     String dateTime = data['datetime'];
//     String offset = data['utc_offset'].substring(1, 3);
//     // print(dateTime);
//     // print(offset);

//     DateTime now = DateTime.parse(dateTime);
//     now = now.add(Duration(hours: int.parse(offset)));
//     // print(now);

//     // set the time property

//     time = now.toString();
//   }
// }
