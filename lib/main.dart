import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_files/controller/count_controller.dart';
import 'package:free_files/route.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  // Crée le contrôleur de crédit et initialise les crédits avec la valeur sauvegardée
  final creditController = Get.put(CountCredit());
  creditController.obtenir();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        brightness: Brightness.dark,
      ),
      routes: route,
      initialRoute: "/home",
    );
  }
}
