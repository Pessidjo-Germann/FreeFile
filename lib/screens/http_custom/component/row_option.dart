import 'package:flutter/material.dart';

class RowOption extends StatefulWidget {
  RowOption({
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
  State<RowOption> createState() => _RowOptionState();
}

class _RowOptionState extends State<RowOption> {
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
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
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
