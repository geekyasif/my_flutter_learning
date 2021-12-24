// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              TableCell(
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Action',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
