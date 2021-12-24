// import 'package:crud/pages/add_data.dart';
// import 'package:crud/pages/read_data.dart';
// // ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/pages/crud.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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

  CrudMethods crudMethods = new CrudMethods();

  uploadBlog() {
    FirebaseFirestore.instance.collection("blogs").add({
      "author_name": authorTextEdittingController.text,
      "desc": descTextEdittingController.text,
      "title": titleTextEdittingController.text
    });

    print(authorTextEdittingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud App"),
        actions: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AddData()));
                },
                child: Text("Add Data")),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(children: [
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
                uploadBlog();
              },
              child: Text("Upload Data"))
        ]),
      ),
    );
  }
}
