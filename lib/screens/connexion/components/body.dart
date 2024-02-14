import 'package:flutter/material.dart';
import 'package:free_files/constante.dart';

import 'connexion_formulaire.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.onPress});
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TextEditingController password = TextEditingController();
    // TextEditingController email = TextEditingController();
    return SingleChildScrollView(
      child: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Connexion",
              style: TextStyle(fontSize: (50)),
            ),
            const SizedBox(
              height: 100,
            ),
            ConnexionFormulaire(
              size: size,
              onPress: onPress,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pas encore de compte ?  ",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: onPress,
                  child: Text(
                    "Creez-un!",
                    style: TextStyle(color: kPrimaryColor, fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
