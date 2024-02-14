import 'package:flutter/material.dart';
import 'package:free_files/screens/inscription/components/body.dart';

class Inscription extends StatelessWidget {
  static String routeName = "/inscription";
  const Inscription({super.key, required this.onPress});
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
