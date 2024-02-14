import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_files/screens/connect_or_login/auth_or_login.dart';
import 'package:free_files/screens/home/home_page_screen.dart';

class AuthScreen extends StatelessWidget {
  static String routeName = "/auth";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //On attends l'authentification
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              //lorsqu'on trouve les donnees
              return Home();
            } else {
              return const AuthOrLogin();
            }
          }
        },
      ),
    );
  }
}
