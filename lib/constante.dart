import 'package:flutter/material.dart';
import 'package:free_files/accede_dialog_box.dart';

import 'dialog_box.dart';

Future<void> information(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildcontext) {
        return DialogBox(buildContext: buildcontext);
      });
}

Future<void> informationToAccede(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildcontext) {
        return DialogBox2(buildContext: buildcontext);
      });
}

const String idBanner = 'ca-app-pub-6703886829471869/5639171650';
const kPrimaryColor = Color.fromARGB(255, 241, 27, 12);
const kDartColor = Colors.black;

const String tunnelInformation = """
\t\t      Bienvenue dans l'espace Ha tunnel !
Dans cette application vous allez avoir acces a deux types de fichiers:
   -Les fichier "70Mo par jour" qui vont vous offrir 70Mo par jour,
 -Les fichiers "Night surf" qui vous donnerons acces  a internet sans LIMITES!!                 
          """;

const String customInformation = """
\t\t      Bienvenue dans l'espace Http custom !
Dans cette application vous allez avoir acces a deux types de fichiers:
   -Les fichier "70Mo par jour" qui vont vous offrir 70Mo par jour,
 -Les fichiers "Night surf" qui vous donnerons acces  a internet sans LIMITES!!                 
          """;
const String injectorInformation = """
\t\t      Bienvenue dans l'espace FreeFile !

          """;

const String sockipsInformation = """
\t\t      Bienvenue dans l'espace SocksIP !
Dans cette application vous allez avoir acces a deux types de fichiers:
   -"Request tunnel" qui fonctionne tres bien le jour mais mieux la nuit,
 -"Udp Request" qui fonctionne mieux en journee que la nuit.                 
          """;

var outlineInput = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide(color: Colors.white),
  gapPadding: 10,
);

var styleLabelForm = TextStyle(
  color: kPrimaryColor,
  fontSize: 32,
);
GestureDetector bouttonDefaut(
    Size size, Function() function, String text, bool isLoading) {
  return GestureDetector(
    onTap: function,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 120,
        vertical: 14.5,
      ),
      width: size.width * 0.85,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
    ),
  );
}

GestureDetector bouttonDefautSecond(
    Size size, Function() function, String text, bool isLoading) {
  return GestureDetector(
    onTap: function,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 14.5,
      ),
      width: size.width * 0.5,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
    ),
  );
}

final RegExp emailValidator = RegExp(r"^[a-zA-z0-9.]+@[a-zA-z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please entrer votre email";
const String kInvalidEmailNullError = "Please entrer un email valid";
const String kPasswordNullError = "Please entrer votre mot de passe";
const String kShortPasswordError = "Mot de passe trop court";
const String kMatchPasswordError = "Pas de mot de pass correspondant";
const String kPasswordsError = "Les mots de pass ne correspondent pas";
const String kNameNullError = "Please entrer votre nom";
const String kPhoneNullError = "Please entrer votre numero de telephone";
const String kAddressNullError = "Please entrer votre address";
