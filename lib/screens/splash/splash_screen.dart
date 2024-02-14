import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_files/screens/splash/components/body.dart';
import 'package:free_files/size_config.dart';

class SplashScreens extends StatefulWidget {
  static String routeName = '/splash_screen';
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/connexion');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
