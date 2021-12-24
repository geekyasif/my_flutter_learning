import 'package:flutter/material.dart';

import 'AppBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget eachVideo(String asset, String title, String channelDesc) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              asset,
              height: 220.0,
              fit: BoxFit.contain,
            ),
          ],
        ),
        Container(
          color: Colors.grey[900],
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/images/Asif.png',
                    width: 30.0,
                    // height: 40.0,
                  ),
                  // radius: .0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      channelDesc,
                      style: TextStyle(color: Colors.grey[500], fontSize: 11.0),
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 6.0,
          child: Container(
            color: Colors.grey[800],
          ),
        )
      ],
    );
  }

  Widget tags(text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 80.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.grey[800]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 13.0),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: topAppBar,
      bottomNavigationBar: bottomBar,
      body: Column(
        children: [
          Container(
            height: 50.0,
            // width: 40.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                tags("All"),
                tags("Treading"),
                tags("Python"),
                tags("Javascript"),
                tags("Music"),
                tags("Movies"),
                tags("Computer Programming"),
                tags("Bollywood"),
                tags("Lives"),
              ],
            ),
          ),
          Container(
            height: 497.0,
            // width: 400.0,
            child: ListView(
              children: [
                // tags(),
                eachVideo(
                    "assets/images/2.png",
                    "Get Phone Number Information Using Python🔥",
                    "Geekyasif 1 lakh views 1 year ago"),
                eachVideo(
                    "assets/images/4.png",
                    "News Reader in Python To Read News Articles🔥",
                    "Geekyasif 1 lakh views 1 year ago"),
                eachVideo(
                    "assets/images/5.png",
                    "Create  Screen Recorder using python 🔥",
                    "Geekyasif 1 lakh views 1 year ago"),
                eachVideo(
                    "assets/images/6.png",
                    "Create  Screen Recorder  using python 🔥",
                    "Geekyasif 1 lakh views 1 year ago"),
                eachVideo(
                    "assets/images/audio.png",
                    "Create  Screen Recorder using python 🔥",
                    "Geekyasif 1 lakh views 1 year ago"),
                eachVideo(
                    "assets/images/covid.png",
                    "Create  Screen Recorder using python 🔥",
                    "Geekyasif 1 lakh views 1 year ago"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//  ListView(
//               children: [
//                 // tags(),
//                 eachVideo(
//                     "assets/images/2.png",
//                     "Get Phone Number Information Using Python🔥",
//                     "Geekyasif 1 lakh views 1 year ago"),
//                 eachVideo(
//                     "assets/images/4.png",
//                     "News Reader in Python To Read News Articles🔥",
//                     "Geekyasif 1 lakh views 1 year ago"),
//                 eachVideo(
//                     "assets/images/5.png",
//                     "Create  Screen Recorder using python 🔥",
//                     "Geekyasif 1 lakh views 1 year ago"),
//                 eachVideo(
//                     "assets/images/6.png",
//                     "Create  Screen Recorder  using python 🔥",
//                     "Geekyasif 1 lakh views 1 year ago"),
//                 eachVideo(
//                     "assets/images/audio.png",
//                     "Create  Screen Recorder using python 🔥",
//                     "Geekyasif 1 lakh views 1 year ago"),
//                 eachVideo(
//                     "assets/images/covid.png",
//                     "Create  Screen Recorder using python 🔥",
//                     "Geekyasif 1 lakh views 1 year ago"),
//               ],
//             ),