import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constante.dart';
import 'form_error.dart';

class ConnexionFormulaire extends StatefulWidget {
  const ConnexionFormulaire({
    super.key,
    required this.size,
    required this.onPress,
  });

  final void Function()? onPress;
  final Size size;

  @override
  State<ConnexionFormulaire> createState() => _ConnexionFormulaireState();
}

class _ConnexionFormulaireState extends State<ConnexionFormulaire> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  signInWithYourEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pas d\'utilisateur trouve')),
        );
      } else if (e.code == 'wrong password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Mot de pass incorrect"),
          ),
        );
      } else if (e.code == 'NETWORK') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Veuillez verifier votre connexion"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              emailTextForm(email),
              SizedBox(height: widget.size.height * 0.05),
              passwordTextForm(password),
              SizedBox(height: widget.size.height * 0.04),
              Row(
                children: [
                  SizedBox(width: widget.size.width * 0.44),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Mot de passe oublie?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              FormError(error: errors),
              SizedBox(height: widget.size.height * 0.04),
              bouttonDefaut(widget.size, () {
                if (_formKey.currentState!.validate()) {
                  // _formKey.currentState!.save();
                  debugPrint(email.text);
                  debugPrint(password.text);

                  signInWithYourEmailAndPassword();
                }
              }, "Continue", isLoading),
            ],
          ),
        ));
  }

  TextFormField passwordTextForm(TextEditingController password) {
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
          hintText: '1234556',
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: styleLabelForm,
          enabledBorder: outlineInput,
          focusedBorder: outlineInput,
          suffixIcon: const Icon(Icons.key_sharp),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 43,
            vertical: 23,
          )),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPasswordsError)) {
          setState(() {
            errors.remove(kPasswordsError);
          });
        } else if (value.length > 8 && errors.contains(kShortPasswordError)) {
          setState(() {
            errors.remove(kShortPasswordError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPasswordsError)) {
          setState(() {
            errors.add(kPasswordsError);
          });
          return '';
        } else if (value.length < 8 && !errors.contains(kShortPasswordError)) {
          setState(() {
            errors.add(kShortPasswordError);
          });
          return '';
        }
        return null;
      },
    );
  }

  TextFormField emailTextForm(TextEditingController email) {
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
        hintText: "test@gmail.com",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 23,
        ),
        labelStyle: styleLabelForm,
        suffixIcon: const Icon(Icons.email),
        enabledBorder: outlineInput,
        focusedBorder: outlineInput,
      ),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kInvalidEmailNullError);
          });
        } else if (emailValidator.hasMatch(value) &&
            errors.contains(kInvalidEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidator.hasMatch(value) &&
            !errors.contains(kInvalidEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailNullError);
          });
        }
      },
    );
  }
}
