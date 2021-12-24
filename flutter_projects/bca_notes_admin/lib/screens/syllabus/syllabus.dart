import 'dart:isolate';
import 'dart:ui';
import 'package:bca_notes/screens/home/view_pdf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  final Stream<QuerySnapshot> _syllabusStream =
      FirebaseFirestore.instance.collection('syllabus').snapshots();

  int progress = 0;

  final ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort!.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });

      print("downloading progess ------ $progress");
    });

    FlutterDownloader.registerCallback(downloadingCallback);
  }
  // bool downloading = false;
  // var progressString = "";

  // void showToast(String msg) =>
  //     Fluttertoast.showToast(msg: msg, textColor: Colors.grey);

  // Future<void> downloadFile(String url, String title) async {
  //   Dio dio = Dio();

  //   try {
  //     var dir = await getApplicationDocumentsDirectory();

  //     await dio.download(url, "${dir.path}/$title.pdf",
  //         onReceiveProgress: (rec, total) {
  //       print("Rec: $rec , Total: $total");

  //       setState(() {
  //         downloading = true;
  //         progressString = ((rec / total) * 100).toStringAsFixed(1) + "%";
  //       });
  //     });
  //   } catch (e) {
  //     print(e);
  //   }

  //   setState(() {
  //     downloading = false;
  //     progressString = "Download Completed";
  //     // showToast("File Downloaded");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _syllabusStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewPdf(url: data['url'], title: data['title'])));
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['semester'],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    IconButton(
                        onPressed: () async {
                          final status = await Permission.storage.request();
                          if (status.isGranted) {
                            final externalDir =
                                await getExternalStorageDirectory();
                            // getExternalStorageDirectory

                            // ignore: unused_local_variable
                            final id = await FlutterDownloader.enqueue(
                              url: data['url'],
                              savedDir: externalDir!.path,
                              fileName: "${data['title']}.pdf",
                              showNotification:
                                  true, // show download progress in status bar (for Android)
                              openFileFromNotification:
                                  true, // click on notification to open downloaded file (for Android)
                            );
                          } else {
                            print("Permission deined");
                          }

                          // await downloadFile(data['url'], data['title']);
                          // final snackBar = SnackBar(
                          //   content: Text(progressString),
                          // );
                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(snackBar);
                        },
                        icon: const Icon(
                          Icons.download,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}



// downloading == true
//             ? Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey[800],
//                       borderRadius: BorderRadius.all(Radius.circular(6.0))),
//                   height: 60.0,
//                   width: 200.0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Downloading $progressString",
//                         style: TextStyle(color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             :