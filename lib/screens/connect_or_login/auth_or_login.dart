import 'package:flutter/material.dart';
import 'package:free_files/screens/connexion/sign_up.dart';
import 'package:free_files/screens/inscription/incription_screen.dart';

class AuthOrLogin extends StatefulWidget {
  static String routeName = '/auth_or_login';
  const AuthOrLogin({super.key});

  @override
  State<AuthOrLogin> createState() => _AuthOrLoginState();
}

class _AuthOrLoginState extends State<AuthOrLogin> {
  bool isLogin = true;
  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return SignUpScreen(
        onPress: togglePage,
      );
    } else {
      return Inscription(
        onPress: togglePage,
      );
    }
  }
}
