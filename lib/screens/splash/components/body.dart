import 'package:flutter/material.dart';
import 'package:free_files/size_config.dart';
import 'package:free_files/constante.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(340)),
              child: Text(
                "FREEFILE",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(50),
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
