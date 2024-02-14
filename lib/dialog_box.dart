import 'package:flutter/material.dart';

import 'add_display.dart';
import 'constante.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
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
              const Text("Oups!", textAlign: TextAlign.center),
              const Text(
                "Hello !",
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                "Pour obtenir 10 credits vous allez être redirigé vers une publicité!",
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                "Acceptez vous?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        try {
                          AdDisplay().loadRewarded(context);
                        } catch (e) {
                          debugPrint("Erreur de connexion");
                        }

                        Navigator.pop(buildContext);
                      },
                      child: const Text(
                        "OUI",
                        style: TextStyle(color: kPrimaryColor),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                      },
                      child: const Text("Non"))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
