// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iul/ad_helper.dart';
import 'package:iul/widgets/card.dart';

import '../webview/iul.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  final String iulLink = "https://iul.ac.in/";
  final String iliLink = "https://ilizone.iul.ac.in/";
  final String iusmsLink = "https://iusms.iul.ac.in/";
  final String iulForumLink = "https://iulforum.tech/";

  final BannerAd myBanner = BannerAd(
    adUnitId: '<ad unit id>',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  Widget appBar = Container(
    // margin: EdgeInsets.only(top: 30.0),
    padding: const EdgeInsets.all(30.0),
    decoration: BoxDecoration(
        color: Colors.lightBlue[900],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0))),
    child: Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 80.0,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          "IUL CONNECT",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ],
    ),
  );

  @override
  void initState() {
    // TODO: Initialize _bannerAd
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          appBar,
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IUL(
                                  url: "https://iul.ac.in/",
                                ))),
                    child: const CustomCard(
                        name: "IUL OFFICIAL",
                        imageUrl: 'assets/images/iul.png'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IUL(
                                  url: "https://ilizone.iul.ac.in/",
                                ))),
                    child: const CustomCard(
                        name: "ILIZONE", imageUrl: 'assets/images/ili.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IUL(
                                  url: "https://sms.iul.ac.in/",
                                ))),
                    child: const CustomCard(
                        name: "IUSMS", imageUrl: 'assets/images/iusms.png'),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IUL(
                                  url: "https://iulforum.tech/",
                                ))),
                    child: const CustomCard(
                        name: "IUL FORUM",
                        imageUrl: 'assets/images/iulforum.png'),
                  ),
                ],
              )
            ],
          ),
          if (_isBannerAdReady)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
        ],
      ),
    );
  }
}
