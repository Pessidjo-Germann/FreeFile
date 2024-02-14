import 'package:flutter/material.dart';

import 'constante.dart';

class DialogBox2 extends StatelessWidget {
  const DialogBox2({
    super.key,
    required this.buildContext,
  });
  final BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20),
      title: const Text(
        "Information",
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryColor, fontSize: 24),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Vos fichiers télechargés se trouvent dans votre dossier Download",
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text("Allez y et Bon Surf!!", textAlign: TextAlign.justify),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                      },
                      child: const Text("OK"))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
