import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:random_string/random_string.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late String title, desc, author;
  bool isLoading = false;
  CollectionReference post = FirebaseFirestore.instance.collection('posts');

  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

  // getting image from phone
  Future getImage() async {
    XFile? image = (await _picker.pickImage(source: ImageSource.gallery));
    setState(() {
      selectedImage = image;
    });
  }

  // uploading image and data to firebase
  uploadBlog() async {
    final _fireStorage = firebase_storage.FirebaseStorage.instance;
    if (selectedImage != null) {
      final file = File(selectedImage!.path);

      try {
        print('uploading');
        String fileName = file.uri.path.split('/').last;

        // Uploading Image to FirebaseStorage
        var filePath = await _fireStorage
            .ref()
            .child('blogImages/$fileName')
            .putFile(file);

        // Getting Uploaded Image Url
        String downloadUrl = await filePath.ref.getDownloadURL();
        post.add({
          'title': title, // John Doe
          'desc': desc, // Stokes and Sons
          'author': author,
          'imageUrl': downloadUrl // 42
        }).then((value) {
          print("User Added");
          Navigator.pop(context);
        }).catchError((error) => print("Failed to add user: $error"));

        print('fileuploaded');

        // var downloadUrl = await (await task.whenComplete( ()=> )).ref.getDownloadURL();

      } catch (e) {
        print("uploading failfauo faul fail");
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        actions: [
          IconButton(
              onPressed: () {
                uploadBlog();
              },
              icon: const Icon(Icons.upload))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    // print(File(selectedImage!.path));
                    getImage();
                  },
                  // ignore: unnecessary_null_comparison
                  child: selectedImage != null
                      ? Container(
                          height: 200.0,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Image.file(File(selectedImage!.path)),
                        )
                      : Container(
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
              TextField(
                decoration: const InputDecoration(hintText: "Title"),
                onChanged: (val) {
                  title = val;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Description"),
                onChanged: (val) {
                  desc = val;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
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
        ),
      ),
    );
  }
}
