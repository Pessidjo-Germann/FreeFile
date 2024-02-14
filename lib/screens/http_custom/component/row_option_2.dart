import 'package:flutter/material.dart';

import '../../../constante.dart';

class RowOption2 extends StatelessWidget {
  const RowOption2({
    super.key,
    required this.selectedType2,
  });

  final String selectedType2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Row(
        children: [
          Text(
            "Combien de jours:",
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Container(
            width: 170,
            height: 66,
            child: DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: "07",
                  child: Text("07 jours"),
                ),
              ],
              value: selectedType2,
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                fillColor: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
