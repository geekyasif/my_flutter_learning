import 'dart:isolate';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  String url = "";
  // bool downloading = false;
  // var progressString = "";

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getNotes() {
    firestore.collection('timetable').get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          url = doc['url'];
        });
      }
    });
  }

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
    getNotes();

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

  // @override
  // void initState() {
  //   super.initState();
  //
  // }

  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping('downloader_send_port');
  //   super.dispose();
  // }

  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([id, status, progress]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: url == ""
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SfPdfViewer.network(
              url,
              key: _pdfViewerKey,
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () async {
          final status = await Permission.storage.request();
          if (status.isGranted) {
            final externalDir = await getExternalStorageDirectory();

            final id = await FlutterDownloader.enqueue(
              url: url,
              savedDir: externalDir!.path,
              fileName: "IU_BCA_Time_Table.pdf",
              showNotification:
                  true, // show download progress in status bar (for Android)
              openFileFromNotification:
                  true, // click on notification to open downloaded file (for Android)
            );
          } else {
            print("Permission deined");
          }

          // await downloadFile(url, 'timetable');
          // final snackBar = SnackBar(
          //   content: Text(progressString),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Icon(
          Icons.download,
          color: Colors.white,
        ),
      ),
    );
  }
}
