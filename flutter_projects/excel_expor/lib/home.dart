import 'package:excel_expor/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String num = "";
  String checkNum = "";
  String id = "";
  String status = "";

  CollectionReference phone = FirebaseFirestore.instance.collection('phone');

  Future<void> addPhoneNumber(String num) {
    return phone
        .add({
          'number': num, // John Doe
          'status': "true", // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateUser(context, id) {
    return phone
        .doc(id)
        .update({'status': 'true'})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage())))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Excel test"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  num = val;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  addPhoneNumber(num);
                  print(num);
                },
                child: Text("Add number")),
            TextField(
              onChanged: (val) {
                setState(() {
                  checkNum = val;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await phone
                      .where('number', isEqualTo: checkNum)
                      .get()
                      .then((QuerySnapshot querySnapshot) {
                    querySnapshot.docs.forEach((doc) {
                      id = doc.id;
                      Map<String, dynamic> data =
                          doc.data()! as Map<String, dynamic>;
                      status = data['status'];
                      print("this is status ${status}");
                      print(id);
                    });
                  });

                  if (status == "true") {
                    phone
                        .doc(id)
                        .get()
                        .then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        updateUser(context, id);
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    });
                  } else {
                    print("ur are not authorise to access");
                  }
                },
                child: Text("Check Number")),
          ],
        ),
      ),
    );
  }
}
