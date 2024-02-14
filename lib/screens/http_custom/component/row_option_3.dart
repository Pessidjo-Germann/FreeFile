import 'package:flutter/material.dart';

class RowOption3 extends StatefulWidget {
  RowOption3({
    super.key,
    this.selectedType = "",
    required this.valueItem1,
    required this.valueItem2,
    required this.menuItem1,
    required this.menuItem2,
    required this.question,
  });
  String selectedType;
  final String valueItem1, valueItem2;
  final String menuItem1, menuItem2, question;

  @override
  State<RowOption3> createState() => _RowOption3State();
}

class _RowOption3State extends State<RowOption3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Row(
        children: [
          Text(
            widget.question,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          SizedBox(
            width: 170,
            height: 66,
            child: DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  value: widget.valueItem2,
                  child: Text(widget.menuItem2),
                ),
                DropdownMenuItem(
                  value: widget.valueItem1,
                  child: Text(widget.menuItem1),
                ),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              value: widget.selectedType,
              onChanged: (value) {
                setState(() {
                  widget.selectedType = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
