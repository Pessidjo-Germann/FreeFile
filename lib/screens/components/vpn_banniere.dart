import 'package:flutter/material.dart';

class VpnBanniere extends StatelessWidget {
  const VpnBanniere({
    super.key,
    required this.size,
    required this.img,
    required this.text,
  });

  final Size size;
  final String img, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: size.height * 0.16,
      decoration: BoxDecoration(
          color: Colors.white10, //Color.fromARGB(42, 75, 92, 102),
          border: Border.all(
            color: Colors.white10,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.31,
            height: size.height * 0.14,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(img),
            ),
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            text,
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
