import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatePost extends StatefulWidget {
  final String id;
  const UpdatePost({Key? key, required this.id}) : super(key: key);

  @override
  _UpdatePostState createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  late final String title, desc, author;

  CollectionReference users = FirebaseFirestore.instance.collection('posts');

  Future<void> updateData() {
    return users
        .doc(widget.id)
        .update({
          'title': title,
          'desc': desc,
          'author': author,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Data"),
          actions: [
            IconButton(
                onPressed: () {
                  updateData();
                },
                icon: const Icon(Icons.upload))
          ],
        ),
        body: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('students')
              .doc(widget.id)
              .get(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              print('Something Went Wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            var data = snapshot.data!.data();
            var title = data?['title'];
            var desc = data?['desc'];
            var author = data?['author'];

            return Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        // getImage();
                      },
                      // ignore: unnecessary_null_comparison
                      child: Container(
                        height: 200.0,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: const Center(
                          child: Icon(Icons.add_a_photo),
                        ),
                      )),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: title,
                    decoration: const InputDecoration(hintText: "Title"),
                    onChanged: (val) {
                      title = val;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: desc,
                    decoration: const InputDecoration(hintText: "Description"),
                    onChanged: (val) {
                      desc = val;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: author,
                    decoration: const InputDecoration(hintText: "Author"),
                    onChanged: (val) {
                      author = val;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            );
          },
        )));
  }
}
