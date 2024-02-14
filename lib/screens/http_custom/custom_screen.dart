import 'package:flutter/material.dart';
import 'package:free_files/screens/http_custom/component/body.dart';

class CustomScreen extends StatelessWidget {
  static String routeName = "/custom";
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
