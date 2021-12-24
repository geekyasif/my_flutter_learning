import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebase/update_data.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> deleteUser(name) {
    return users
        .doc(name)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Fetched Data"),
          ),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              data['id'] = document.id;
              // print(data);
              return ListTile(
                onTap: () {
                  deleteUser(data['id']);
                  // final id = int.parse(data['id']);
                  // print(data['id']);
                },
                title: Text(data['name']),
                subtitle: Text(data['title']),
                onLongPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateData(id: data['id'])));
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
