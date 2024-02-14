import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:free_files/controller/function_api.dart';
import 'package:free_files/screens/home/components/credit_box.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../constante.dart';
import '../../../controller/count_controller.dart';
import '../../components/custom_bar_vpn.dart';
import '../../components/row_how_to_acced.dart';
import '../../components/vpn_banniere.dart';
import '../../ha_tunnel/components/body.dart';
import '../../http_custom/component/row_option_2.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BannerAd? _bannerAd;
  bool isLoaded = false;
  final AdSize adSize = const AdSize(width: 300, height: 50);
  bool isLoading = false;
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

  @override
  void initState() {
    super.initState();
    //init load
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String selectType = "07";
    final c = Get.put(CountCredit());
    int credit = 0;
    c.onUpdate(credit);
    return Container(
      color: kDartColor,
      child: SafeArea(
        child: Column(
          children: [
            CustomBarVpn(
              size: size,
              text: "Http Injector",
            ),
            CreditBox(
              size: size,
              credit: credit,
            ),
            SizedBox(height: size.height * 0.02),
            VpnBanniere(
              size: size,
              img: "asset/images/http injector.jpeg",
              text: "Http Injector",
            ),
            SizedBox(height: size.height * 0.02),
            InformationBox(size: size, information: injectorInformation),
            SizedBox(height: size.height * 0.02),
            const RowHowToAccede(),
            SizedBox(height: size.height * 0.03),
            RowOption2(selectedType2: selectType),
            //  Spacer(flex: 2),
            Container(height: 50),
            //  Spacer(),
            SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child:
                  _bannerAd != null ? AdWidget(ad: _bannerAd!) : const Text(""),
            ),
            const Spacer(),
            bouttonDefautSecond(size, () async {
              if (c.credit < 20) {
                setState(() {
                  isLoading = true;
                });
                information(context);
                setState(() {
                  isLoading = false;
                });
              } else {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  String url = await getUrlInjector();
                  Uri uri = Uri.parse(url);
                  launchUrl(uri);

                  c.onDeletes();
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                  return ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        "Erreur lors de la connexion!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  );
                }
              }
            }, "Telecharger", isLoading),
            // Spacer(),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
