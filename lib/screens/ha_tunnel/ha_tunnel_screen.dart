import 'package:flutter/material.dart';
import 'package:free_files/screens/ha_tunnel/components/body.dart';

class TunnelScreen extends StatelessWidget {
  static String routeName = "/tunnel";
  const TunnelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
