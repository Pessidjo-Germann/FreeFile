import 'package:flutter/material.dart';
import 'package:free_files/screens/connexion/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/connexion";
  const SignUpScreen({super.key, required this.onPress});
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        onPress: onPress,
      ),
    );
  }
}
