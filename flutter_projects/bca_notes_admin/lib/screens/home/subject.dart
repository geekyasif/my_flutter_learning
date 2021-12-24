import 'package:bca_notes/screens/home/notes_paper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Subject extends StatefulWidget {
  final String sem;
  final String imgUrl;
  const Subject({Key? key, required this.sem, required this.imgUrl})
      : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  List<Map<String, dynamic>> subjects = [];
  // Map<String, dynamic> subjects = {};
  bool _isloading = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getData() async {
    await firestore
        .collection('subjects')
        .where('semester', isEqualTo: widget.sem)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          subjects.add(doc.data()! as Map<String, dynamic>);
        });
        // print(doc[0].data());
      }
    });
    _isloading = false;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          // title: Text(widget.sem),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag: widget.sem, child: Image.asset(widget.imgUrl)),
              _isloading
                  ? Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )))
                  : Expanded(
                      child: ListView(
                        children: subjects.map((data) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NotesPaper(sub: data['name'])));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1.0,
                                    ), //B
                                    //BoxShadow
                                  ],
                                ),
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      data['code'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      data['name'],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    )
                                  ],
                                )),
                          );
                        }).toList(),
                      ),
                    )
            ],
          ),
        ));
  }
}


// Center(
//           child: Column(
//             children: [
              // Hero(tag: widget.sem, child: Image.asset(widget.imgUrl)),
              // _isloading
              //     ? Container(
              //         margin: const EdgeInsets.only(top: 50.0),
              //         child: const Center(child: CircularProgressIndicator()))
              //     : Expanded(
//                       child: ListView.builder(
//                         // padding: const EdgeInsets.all(10.0),
//                         itemCount: subjects.length,
//                         itemBuilder: (context, name) {
                          // return InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => NotesPaper(
                          //                 sub: subjects[name].toString())));
                          //   },
                          //   child: Container(
                          //       decoration: BoxDecoration(
                          //         color: Colors.grey[800],
                          //         boxShadow: const [
                          //           // BoxShadow(
                          //           //   offset: Offset(
                          //           //     3.0,
                          //           //     3.0,
                          //           //   ),
                          //           //   blurRadius: 5.0,
                          //           //   spreadRadius: 1.0,
                          //           // ), //BoxShadow
                          //           BoxShadow(
                          //             color: Colors.grey,
                          //             // offset: const Offset(0.0, 1.0),
                          //             blurRadius: 1.0,
                          //             // spreadRadius: ,
                          //           ), //B
                          //           //BoxShadow
                          //         ],
                          //       ),
                          //       margin: const EdgeInsets.all(5.0),
                          //       padding: const EdgeInsets.all(25.0),
                          //       // decoration: BoxDecoration(
                          //       //     border: Border.all(color: Colors.grey)),
                          //       child: Row(
                          //         children: [
                          //           Icon(
                          //             Icons.circle,
                          //             color: Colors.grey[400],
                          //           ),
                          //           const SizedBox(
                          //             width: 20.0,
                          //           ),
                          //           Center(
                          //               child: Text(
                          //             subjects[name].toString(),
                          //             style: const TextStyle(
                          //                 color: Colors.white, fontSize: 16.0),
                          //           )),
                          //         ],
                          //       )),
                          // );
//                         },
//                       ),
//                     )
//             ],
//           ),
//         )