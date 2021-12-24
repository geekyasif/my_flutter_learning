import 'dart:io';

import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void readExcelFile() {
    var file = "assets/file.xlsx";
    var bytes = File(file).readAsBytesSync();
    // var excel = Excel.createExcel();
    // or
    var excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      print(table);
      print(excel.tables[table]!.maxCols);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print("${row.map((e) => e?.value)}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("click"),
        onPressed: () {
          readExcelFile();
        },
      ),
    );
  }
}
