import 'package:flutter/material.dart';

import 'package:free_files/screens/inscription/components/inscription_form.dart';

import '../../../constante.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.onPress});
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Inscription',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 100,
            ),
            InscriptionFormulaire(size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Deja un Compte ?  ",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: onPress,
                  child: const Text(
                    "Connectez-vous!",
                    style: TextStyle(color: kPrimaryColor, fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
