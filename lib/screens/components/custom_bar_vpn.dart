import 'package:flutter/material.dart';

class CustomBarVpn extends StatelessWidget {
  const CustomBarVpn({
    super.key,
    required this.size,
    required this.text,
    this.color = Colors.white, // Colors.blueGrey,
  });

  final Size size;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        SizedBox(width: size.width * 0.25),
        Text(
          text,
          style: TextStyle(
            fontSize: 21,
            color: color,
          ),
        ),
      ],
    );
  }
}
