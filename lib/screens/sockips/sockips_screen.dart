import 'package:flutter/material.dart';
import 'package:free_files/screens/sockips/components/body.dart';

class SockipsScreen extends StatelessWidget {
  static String routeName = "/sockips";
  const SockipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
