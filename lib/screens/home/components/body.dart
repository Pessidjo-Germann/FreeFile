import 'dart:io';

import 'package:flutter/material.dart';
import 'package:free_files/add_display.dart';
import 'package:free_files/constante.dart';
import 'package:free_files/controller/function_api.dart';
import 'package:free_files/screens/ha_tunnel/ha_tunnel_screen.dart';
import 'package:free_files/screens/http_custom/custom_screen.dart';
import 'package:free_files/screens/http_injector/injector_screen.dart';
import 'package:free_files/screens/sockips/sockips_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'box_vpn.dart';
import 'credit_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BannerAd? _bannerAd;
  bool isLoaded = false;
  final AdSize adSize = const AdSize(width: 300, height: 50);

  final adUnitId =
      Platform.isAndroid ? idBanner : 'ca-app-pub-3940256099942544/2934735716';

  /// Loads a banner ad.
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  String message = "";
  Future<String> messa() async {
    message = await getTextCustom();
    return message;
  }

  @override
  void initState() {
    super.initState();
    //init load
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int credit = 0;
    messa();
    return Container(
      color: kDartColor,
      child: SafeArea(
        child: Column(
          children: [
            //      const CustomAppBar(),
            CreditBox(
              size: size,
              credit: credit,
            ),
            const SizedBox(height: 8),
            welcomeMessageBox(),
            const SizedBox(height: 8),
            const Divider(
              thickness: 3,
              height: 30,
            ),
            SizedBox(height: size.height * 0.0001),
            const Text(
              "Choisis ton VPN:",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoxVpn(
                  size: size,
                  imgPath: "asset/images/http injector.jpeg",
                  text: "Http Injector",
                  press: () {
                    AdDisplay().loadInterstitialAd();
                    Navigator.pushNamed(context, InjectorScreen.routeName);
                  },
                ),
                BoxVpn(
                  size: size,
                  imgPath: "asset/images/http custom.png",
                  text: "Htpp Custom",
                  press: () {
                    AdDisplay().loadInterstitialAd();
                    Navigator.pushNamed(context, CustomScreen.routeName);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoxVpn(
                    size: size,
                    imgPath: "asset/images/ha tunnel.jpeg",
                    text: "Ha Tunnel",
                    press: () {
                      AdDisplay().loadInterstitialAd();
                      Navigator.pushNamed(context, TunnelScreen.routeName);
                    }),
                BoxVpn(
                    size: size,
                    imgPath: "asset/images/sockips.png",
                    text: "Sockips",
                    press: () {
                      AdDisplay().loadInterstitialAd();
                      Navigator.pushNamed(context, SockipsScreen.routeName);
                    }),
              ],
            ),
            //
            const Spacer(),
            SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child:
                  _bannerAd != null ? AdWidget(ad: _bannerAd!) : const Text(""),
            ),
            Text(message),
            const SizedBox(height: 15),
            const Text(
              "Powered by Germann",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Column welcomeMessageBox() {
    return const Column(
      children: [
        Text(
          "FreeFile c'est encore mieux avec ces ami(e)s et potes!!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Invites tes ami(e)s ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              "ici",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: kPrimaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
