import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatefulWidget {
  final String url;
  final String title;
  const ViewPdf({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

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

  // Future<void> downloadFile(String url) async {
  //   Dio dio = Dio();

  //   try {
  //     var dir = await getApplicationDocumentsDirectory();

  //     await dio.download(url, "${dir.path}/bca_iu.pdf",
  //         onReceiveProgress: (rec, total) {
  //       print("Rec: $rec , Total: $total");

  //       setState(() {
  //         downloading = true;
  //         progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
  //       });
  //     });
  //   } catch (e) {
  //     print(e);
  //   }

  //   setState(() {
  //     downloading = false;
  //     progressString = "Download Completed";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
            onPressed: () async {
              final status = await Permission.storage.request();
              if (status.isGranted) {
                final externalDir = await getExternalStorageDirectory();
                // getExternalStorageDirectory

                // ignore: unused_local_variable
                final id = await FlutterDownloader.enqueue(
                  url: widget.url,
                  savedDir: externalDir!.path,
                  fileName: "${widget.title}.pdf",
                  showNotification:
                      true, // show download progress in status bar (for Android)
                  openFileFromNotification:
                      true, // click on notification to open downloaded file (for Android)
                );
              } else {
                print("Permission deined");
              }

              // print("click downlaodng nutton");
              // await downloadFile(widget.url);
              // final snackBar = SnackBar(
              //   content: Text(progressString),
              // );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.url,
        key: _pdfViewerKey,
      ),
    );
  }
}
