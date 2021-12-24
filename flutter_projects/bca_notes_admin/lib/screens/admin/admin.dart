import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Admin extends StatefulWidget {
  const Admin({
    Key? key,
  }) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late String title, url;
  String subjectValue = 'C Programming';
  String semesterValue = 'Semester 1';
  String typeValue = 'notes';

  Map<String, dynamic> data = {};

  CollectionReference pdf = FirebaseFirestore.instance.collection('pdf');

  void showToastAdded() {
    Fluttertoast.showToast(
        msg: 'Data Added Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white);
  }

  void showToastError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white);
  }

  Future<void> addData() {
    return pdf
        .add({
          'title': title, // John Doe
          'url': url, // Stokes and Sons
          'semester': semesterValue,
          'subject': subjectValue,
          'type': typeValue // 42/ 42
        })
        .then((value) => showToastAdded())
        .catchError((error) => showToastError(error));

    // data = {
    //   'title': title, // John Doe
    //   'url': url, // Stokes and Sons
    //   'semester': semesterValue,
    //   'subject': subjectValue,
    //   'type': typeValue // 42
    // };
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add Notes And Paper",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const SizedBox(
              height: 40.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Notes/Paper Title',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Url',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Notes/Paper Url',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                url = value;
              },
            ),
            DropdownButton<String>(
              value: subjectValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                height: 1,
                color: Colors.blue,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  subjectValue = newValue!;
                });
              },
              items: <String>[
                'C Programming',
                'Mathematics 1',
                'Mathematics 2',
                'Essential Communication',
                'Computer Fundamentals',
                'Enviromental Science',
                'System Analysis and Design',
                'Advanced Professional Communication',
                'Computer Organization',
                'Data Structure using C',
                'Combinatorics and Graph Theory',
                'C++',
                'Multimedia System',
                'Database Management System',
                'Discrete Mathematics',
                'Data Compression',
                'Software Engineering',
                'Software Security',
                'Microprocessor',
                'Operating System',
                'JAVA Programming',
                'Computer Graphics',
                'UNIX and Shell Programming',
                'Data Communication',
                'Web Designing Concepts',
                'Image Processing',
                'Elementary Algorithm',
                '.NET Framework with VB. NET',
                'Open Source Environment',
                'Cyber Law and Internet Security',
                'Management Information System',
                'E-Governance',
                'Fundamentals of E-Commerce',
                'ERP Systems',
                'AI and Expert Systems'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DropdownButton<String>(
              value: semesterValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                height: 1,
                color: Colors.blue,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  semesterValue = newValue!;
                });
              },
              items: <String>[
                'Semester 1',
                'Semester 2',
                'Semester 3',
                'Semester 4',
                'Semester 5',
                'Semester 6',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: typeValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                height: 1,
                color: Colors.blue,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  typeValue = newValue!;
                });
              },
              items: <String>[
                'notes',
                'paper',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: () {
                  addData();
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
