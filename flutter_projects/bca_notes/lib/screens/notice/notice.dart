import 'dart:ffi';
import 'dart:isolate';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('notice').snapshots();

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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return InkWell(
              onTap: () async {
                final status = await Permission.storage.request();
                if (status.isGranted) {
                  final externalDir = await getExternalStorageDirectory();
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
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text(
                        data['date'].toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 10.0),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      data['title'],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
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
