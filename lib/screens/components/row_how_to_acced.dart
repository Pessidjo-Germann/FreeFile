import 'package:flutter/material.dart';

import '../../accede_dialog_box.dart';
import '../../constante.dart';

class RowHowToAccede extends StatelessWidget {
  const RowHowToAccede({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Comment acceder a ce fichier ? ",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext buildcontext) {
                  return DialogBox2(buildContext: buildcontext);
                });
          },
          child: const Text(
            "Ici",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }
}
