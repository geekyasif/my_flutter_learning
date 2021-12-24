import 'package:crudfirebase/read_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  final String id;
  UpdateData({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController authorTextEdittingController =
      new TextEditingController();
  TextEditingController titleTextEdittingController =
      new TextEditingController();
  TextEditingController descTextEdittingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final Stream<QuerySnapshot> _usersStream =
    //     FirebaseFirestore.instance.collection('users').snapshots();

    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Future<void> updateUser() {
    //   // Call the user's CollectionReference to add a new user
    //   return users
    //       .add({
    //         'name': authorTextEdittingController.text, // John Doe
    //         'title': titleTextEdittingController.text, // Stokes and Sons
    //         'desc': descTextEdittingController.text, // 42
    //       })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));

    // }

    FirebaseFirestore.instance
        .collection('users')
        .doc('$this.id')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });

    return import 'package:crudfirebase/read_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController authorTextEdittingController =
      new TextEditingController();
  TextEditingController titleTextEdittingController =
      new TextEditingController();
  TextEditingController descTextEdittingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'name': authorTextEdittingController.text, // John Doe
            'title': titleTextEdittingController.text, // Stokes and Sons
            'desc': descTextEdittingController.text, // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: authorTextEdittingController,
              decoration: InputDecoration(hintText: "Author Name"),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: titleTextEdittingController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: descTextEdittingController,
              decoration: InputDecoration(hintText: "Desc"),
            ),
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: Text("Upload")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserInformation()));
                },
                child: Text("see data")),
          ],
        ),
      ),
    );
  }
}

  }
}
