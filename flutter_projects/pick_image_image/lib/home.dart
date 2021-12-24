import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

  Future getImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Pciker"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            getImage();
          },
          child: selectedImage != null
              ? Container(
                  height: 200.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Image.file(File(selectedImage!.path)),
                )
              : Container(
                  height: 200.0,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: const Center(
                    child: Icon(Icons.add_a_photo),
                  ),
                ),
        ),
      ),
    );
  }
}
