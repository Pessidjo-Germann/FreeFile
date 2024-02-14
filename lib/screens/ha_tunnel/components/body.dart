import 'dart:io';

import 'package:flutter/material.dart';
import 'package:free_files/screens/http_custom/component/row_option_2.dart';
import 'package:free_files/screens/http_custom/component/row_option_3.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constante.dart';
import '../../../controller/count_controller.dart';
import '../../../controller/function_api.dart';
import '../../components/custom_bar_vpn.dart';
import '../../components/row_how_to_acced.dart';
import '../../components/vpn_banniere.dart';
import '../../home/components/credit_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  BannerAd? _bannerAd;
  bool isLoading = false;
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

  @override
  void initState() {
    super.initState();
    //init load
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedType = "night";
    var selectedType2 = "07";
    final c = Get.put(CountCredit());
    int credit = 0;

    return Container(
      color: kDartColor,
      child: SafeArea(
        child: Column(
          children: [
            CustomBarVpn(
              size: size,
              text: "Ha Tunnel",
              color: Colors.white,
            ),
            CreditBox(
              size: size,
              credit: credit,
            ),
            SizedBox(height: size.height * 0.02),
            VpnBanniere(
                size: size,
                img: "asset/images/ha tunnel.jpeg",
                text: "Ha tunnel"),
            SizedBox(height: size.height * 0.02),
            InformationBox(size: size, information: tunnelInformation),
            SizedBox(height: size.height * 0.03),
            //Spacer(),
            const RowHowToAccede(),
            SizedBox(height: size.height * 0.02),
            RowOption3(
              selectedType: selectedType,
              question: "Quel type de fichier:",
              valueItem1: "70",
              menuItem1: "70Mo par jour",
              valueItem2: "night",
              menuItem2: "Fichier night",
            ),
            SizedBox(height: size.height * 0.01),
            RowOption2(selectedType2: selectedType2),
            SizedBox(height: size.height * 0.01),
            //  Container(height: 60),
            //const Spacer(),
            SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child:
                  _bannerAd != null ? AdWidget(ad: _bannerAd!) : const Text(""),
            ),
            const Spacer(),
            bouttonDefautSecond(size, () async {
              debugPrint(selectedType);
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
                  String url = await getUrlTunnel();
                  Uri uri = Uri.parse(url);
                  launchUrl(uri);
                  setState(() {
                    isLoading = false;
                  });
                  c.onDeletes();
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

class InformationBox extends StatelessWidget {
  const InformationBox({
    super.key,
    required this.size,
    required this.information,
  });

  final Size size;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(8),
      width: size.width,
      height: size.height * 0.21,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Bienvenue dans l'espace FreeFile ",
              textAlign: TextAlign.center),
          // Text("Alors comment fonctionne FreeFile?",
          //     textAlign: TextAlign.center),
          Spacer(),
          Text(
            "Le systeme fonctionne par CREDIT",
            textAlign: TextAlign.left,
          ),
          Spacer(),
          Text(
            'Ainsi pour obtenir chaque fichier il vous faudra un certains nombre de credit.',
            textAlign: TextAlign.justify,
          ),
          Text(
            "Pour obtenir des fichiers de 07 jours il vous faudra exactement 20 credits.",
            textAlign: TextAlign.justify,
          ),
          Text(
            "Pour obtenir des credits il vous faudra regarder des publicités.",
            textAlign: TextAlign.justify,
          ),
          Spacer(),
          Text("Si vous avez des suggestions merci de nous écrire")
        ],
      ),
    );
  }
}
