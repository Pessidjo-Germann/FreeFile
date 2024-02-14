import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'controller/count_controller.dart';

class AdDisplay {
  final context = BuildContext;
  final c = Get.put(CountCredit());
  final adReward = Platform.isAndroid
      ? 'ca-app-pub-6703886829471869/1953301411'
      : 'ca-app-pub-6703886829471869/1953301411';
  final adUnitIds = Platform.isAndroid
      ? 'ca-app-pub-6703886829471869/2009921983'
      : 'ca-app-pub-3940256099942544/4411468910';

  /// Loads an interstitial ad.
  void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: adUnitIds,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            show(ad);
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void show(InterstitialAd ad) {
    ad.show();
  }

  void loadRewarded(BuildContext context) {
    RewardedAd.load(
        adUnitId: adReward,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            showReward(ad);
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  void showReward(RewardedAd ad) {
    ad.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
      // Reward the user for watching an ad.
      c.onAdd();
    });
  }
}

Future<void> information(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildcontext) {
        return const SimpleDialog(
          title: Text("Information"),
          children: [
            Text("Desole aucune publicite disponible pour le moment!")
          ],
        );
      });
}
