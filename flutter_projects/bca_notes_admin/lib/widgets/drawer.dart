import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerNavBar extends StatefulWidget {
  const DrawerNavBar({Key? key}) : super(key: key);

  @override
  _DrawerNavBarState createState() => _DrawerNavBarState();
}

class _DrawerNavBarState extends State<DrawerNavBar> {
  // Widget item() {
  //   return    ListTile(
  //           title: Row(
  //             // mainAxisAlignment: MainAxisAlignment.sp,
  //             children: [
  //               Icon(Icons.mail),
  //               SizedBox(
  //                 width: 20.0,
  //               ),
  //               Text('Feedback')
  //             ],
  //           ),
  //           onTap: () {
  //             // Update the state of the app
  //             // ...
  //             // Then close the DrawerNavBar
  //             Navigator.pop(context);
  //           },
  //         ),
  // }

  // String? encodeQueryParameters(Map<String, String> params) {
  //   return params.entries
  //       .map((e) =>
  //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
  //       .join('&');
  // }

  // final Uri emailLaunchUri = Uri(
  //   scheme: 'mailto',
  //   path: 'mdasif08737@gmail.com',
  //   query: encodeQueryParameters(
  //       <String, String>{'subject': 'Example Subject & Symbols are allowed!'}),
  // );

  // final String title = "No Update available";
  Map<String, dynamic> checkUpdateData = {'title': '', 'desc': '', 'url': ''};

  Future checkUpdate() async {
    await FirebaseFirestore.instance
        .collection('update')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        print(doc['title']);
        setState(() {
          checkUpdateData = {
            'title': doc['title'],
            'desc': doc['description'],
            'url': doc['url']
          };
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:
            Colors.grey[800], //This will change the drawer background to blue.
        //other styles
      ),
      child: Drawer(
          // Add a ListView to the DrawerNavBar. This ensures the user can scroll
          // through the options in the DrawerNavBar if there isn't enough vertical
          // space to fit everything.
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200.0,
            color: Colors.grey[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  width: 200.0,
                ),
                // Text(
                //   "BCA IU 📖",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 40.0,
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          ListTile(
            onTap: () async {
              await launch(
                'https://www.iulforum.tech/',
                forceSafariVC: false,
                forceWebView: false,
                headers: <String, String>{'my_header_key': 'my_header_value'},
              );
              Navigator.pop(context);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.open_in_browser,
                  color: Colors.white,
                ),
                Text("Official Website", style: TextStyle(color: Colors.white)),
                Icon(Icons.open_in_new, color: Colors.white)
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0),
            child:
                const Text("Other Apps", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            onTap: () {
              Share.share(
                  'https://www.iulforum.tech/media/files/iulconnect.apk');
              Navigator.pop(context);
            },
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.code,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Iul Connect', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: const Text("Communicate",
                style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.feedback,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Feedback', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  'mailto:mdasif08737@gmail.com?subject=Feedback - BCA IU&body=');

              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Suggetions', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  'mailto:mdasif08737@gmail.com?subject=Suggestion - BCA IU&body=');

              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.bug_report,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Report a bug', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  'mailto:mdasif08737@gmail.com?subject=Report a bug - BCA IU&body=');

              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.note,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Send Notes/Paper', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  'mailto:mdasif08737@gmail.com?subject=Send Notes/Paper - BCA IU&body=');

              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.contact_mail,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Contact Developer', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  'mailto:mdasif08737@gmail.com?subject=Contact Developer - BCA IU&body=');

              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: const Text("Connect", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('Share', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              Share.share('https://www.iulforum.tech/media/files/bcaiu.apk');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(
                  Icons.emoji_emotions,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text('About us', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  "https://github.com/geekyasif/bca-iu/blob/main/about-us.md");
              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: const [
                Icon(Icons.policy, color: Colors.white),
                SizedBox(
                  width: 20.0,
                ),
                Text('Privacy Policy', style: TextStyle(color: Colors.white))
              ],
            ),
            onTap: () {
              launch(
                  "https://github.com/geekyasif/bca-iu/blob/main/privacy-policy.md");
              // Update the state of the app
              // ...
              // Then close the DrawerNavBar
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.update, color: Colors.white),
                  // SizedBox(
                  //   width: 20.0,
                  // ),
                  Text('Check Updates', style: TextStyle(color: Colors.white)),
                  Text(
                    "Version 1.0",
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog<String>(
                  // barrierColor: Colors.black,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.grey[800],
                    title: Text(
                      checkUpdateData['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                      checkUpdateData['desc'],
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => launch(checkUpdateData['url']),
                        child: const Text(
                          'Update Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }
}
