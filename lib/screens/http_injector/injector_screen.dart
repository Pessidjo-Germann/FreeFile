import 'package:flutter/material.dart';
import 'package:free_files/screens/http_injector/component/body.dart';

class InjectorScreen extends StatelessWidget {
  static String routeName = "/injector";
  const InjectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
