import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List getData;

  Widget card(String src, String category, String title) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.network(src),
          Text(category),
          Text(title),
        ],
      ),
    );
  }

  List Data = [];
  Future fetchAlbum() async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2021-10-09&to=2021-10-09&sortBy=popularity&apiKey=f44fe3073fa348b488d0c8ba983d8ef9'));

    var jsonData = jsonDecode(response.body);
    // print(jsonDecode(response.body));
    if (jsonData['status'] == "ok") {
      print(jsonData['articles']);
      Data = jsonData['articles'];
      Data.forEach((element) {
        print(element['url']);
      });
    } else {
      print("Error while fetching data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
      ),
      body: ListView.builder(
        itemCount: Data.length,
        itemBuilder: (context, i) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(Data[i]["urlToImage"]),
                        SizedBox(height: 10.0),
                        Text(Data[i]["author"]),
                        SizedBox(height: 10.0),
                        Text(Data[i]["title"]),
                        SizedBox(height: 10.0),
                        Text(Data[i]["content"]),
                      ],
                    ),
                  )
                  // card(Data[i]['urlToImage'], )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
