import 'package:flutter/material.dart';
import 'package:free_files/screens/authentification/auth_screen.dart';
import 'package:free_files/screens/ha_tunnel/ha_tunnel_screen.dart';
import 'package:free_files/screens/home/components/drawer.dart';
import 'package:free_files/screens/home/home_page_screen.dart';
import 'package:free_files/screens/http_custom/custom_screen.dart';
import 'package:free_files/screens/http_injector/injector_screen.dart';
import 'package:free_files/screens/sockips/sockips_screen.dart';
import 'package:free_files/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreens.routeName: (context) => const SplashScreens(),
  Home.routeName: (context) => Home(),
  // SignUpScreen.routeName: (context) => SignUpScreen(),
  // Inscription.routeName: (context) => Inscription(),
  AuthScreen.routeName: (context) => const AuthScreen(),
  DrawerCustom.routeName: (context) => const Drawer(),
  InjectorScreen.routeName: (context) => const InjectorScreen(),
  CustomScreen.routeName: (context) => const CustomScreen(),
  TunnelScreen.routeName: (context) => const TunnelScreen(),
  SockipsScreen.routeName: (context) => const SockipsScreen(),
};
