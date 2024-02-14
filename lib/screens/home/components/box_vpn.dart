import 'package:flutter/material.dart';
import 'package:free_files/constante.dart';

class BoxVpn extends StatefulWidget {
  const BoxVpn({
    super.key,
    required this.size,
    required this.imgPath,
    required this.text,
    this.press,
  });

  final Size size;
  final String imgPath, text;
  final void Function()? press;

  @override
  State<BoxVpn> createState() => _BoxVpnState();
}

class _BoxVpnState extends State<BoxVpn> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: kPrimaryColor,
      splashColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
          debugPrint(isHover.toString());
        });
      },
      onTap: widget.press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        width: widget.size.width * 0.32,
        height: widget.size.height * 0.16,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(20),
          color: isHover
              ? const Color.fromARGB(26, 197, 33, 33)
              : Colors.transparent,
        ),
        child: Column(
          children: [
            SizedBox(
              width: widget.size.width * 0.22,
              height: widget.size.height * 0.10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
