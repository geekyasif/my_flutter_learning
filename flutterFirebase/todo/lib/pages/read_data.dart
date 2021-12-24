// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'update_data.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        // ignore: non_constant_identifier_names
        final List DataList = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map user = document.data() as Map<String, dynamic>;
          DataList.add(user);
          // user['id'] = document.id;
          print(DataList);
        });

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
                for (var i = 0; i < DataList.length; i++) ...[
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        child: Center(
                          child: Text(
                            DataList[i]['Name'],
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: Center(
                          child: Text(
                            DataList[i]['Email'],
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: Center(
                          child: Row(children: [
                            IconButton(
                                color: Colors.yellow[800],
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateData()));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                color: Colors.grey[800],
                                onPressed: () {},
                                icon: Icon(Icons.delete)),
                          ]),
                        ),
                      ),
                    ),
                  ]),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
