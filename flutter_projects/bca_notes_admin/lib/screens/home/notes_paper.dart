import 'package:bca_notes/screens/home/view_pdf.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesPaper extends StatefulWidget {
  final String sub;
  const NotesPaper({Key? key, required this.sub}) : super(key: key);

  @override
  _NotesPaperState createState() => _NotesPaperState();
}

class _NotesPaperState extends State<NotesPaper> {
  List<Map<String, dynamic>> notes = [];
  List<Map<String, dynamic>> papers = [];

  bool _isloading = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getNotes() {
    firestore
        .collection('pdf')
        .where('subject', isEqualTo: widget.sub)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          if (doc['type'] == 'notes') {
            notes.add(doc.data() as Map<String, dynamic>);
          } else {
            papers.add(doc.data() as Map<String, dynamic>);
          }
        });
      }
    });

    _isloading = false;
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  Widget notesTabBarView() {
    var count = 1;
    return _isloading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : ListView(
            children: notes.map((data) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewPdf(url: data['url'], title: data['title'])));
                },
                child: Container(
                    margin: const EdgeInsets.all(3.0),
                    padding: const EdgeInsets.all(10.0),
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
                    child: Text(
                      " ${count++}   ${data['title']}",
                      style: const TextStyle(color: Colors.white),
                    )),
              );
            }).toList(),
          );
  }

  Widget papersTabBarView() {
    var count = 1;
    return _isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: papers.map((data) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewPdf(url: data['url'], title: data['title'])));
                },
                child: Container(
                    margin: const EdgeInsets.all(3.0),
                    padding: const EdgeInsets.all(10.0),
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
                    child: Text(
                      " ${count++}   ${data['title']}",
                      style: const TextStyle(color: Colors.white),
                    )),
              );
            }).toList(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(widget.sub),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                // icon: Icon(Icons.picture_as_pdf),
                child: Text("Notes"),
              ),
              Tab(
                child: Text("Question Papers"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            notesTabBarView(),
            papersTabBarView(),
          ],
        ),
      ),
    );
  }
}

//  Scaffold(
//         appBar: AppBar(
//           title: Text(widget.sub),
//         ),
// body: GridView.builder(
//   padding: const EdgeInsets.all(20.0),
//   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//       maxCrossAxisExtent: 200,
//       childAspectRatio: 3 / 2,
//       crossAxisSpacing: 20,
//       mainAxisSpacing: 20),
//   itemCount: notes.length,
//   itemBuilder: (context, name) {
    // return InkWell(
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => ViewPdf(url: notes[name])));
    //   },
    //   child: Container(
    //       // margin: EdgeInsets.all(10.0),
    //       decoration:
    //           BoxDecoration(border: Border.all(color: Colors.grey)),
    //       child: Center(child: Text(notes[name]))),
    // );
//   },
// ));
