import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_files/controller/function_api.dart';

import '../../../constante.dart';
import '../../connexion/components/form_error.dart';

class InscriptionFormulaire extends StatefulWidget {
  const InscriptionFormulaire({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  State<InscriptionFormulaire> createState() => _InscriptionFormulaireState();
}

class _InscriptionFormulaireState extends State<InscriptionFormulaire> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final email = TextEditingController();
  final password = TextEditingController();
  final prenom = TextEditingController();
  bool isLoading = false;
  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Un utilisateur a deja cet email"),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
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
              prenomTextForm(),
              SizedBox(height: widget.size.height * 0.04),
              emailTextForm(email),
              SizedBox(height: widget.size.height * 0.04),
              passwordTextForm(password),
              SizedBox(height: widget.size.height * 0.04),
              FormError(error: errors),
              SizedBox(height: widget.size.height * 0.05),
              bouttonDefaut(widget.size, () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  createUserWithEmailAndPassword();
                  await postName(prenom.text);
                }
              }, "Continue", isLoading)
            ],
          ),
        ));
  }

  TextFormField prenomTextForm() {
    return TextFormField(
      controller: prenom,
      decoration: InputDecoration(
          hintText: "Germann",
          labelText: "Prenom",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: styleLabelForm,
          enabledBorder: outlineInput,
          focusedBorder: outlineInput,
          suffixIcon: const Icon(Icons.person_2_rounded),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 43,
            vertical: 23,
          )),
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
          return '';
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
    );
  }

  TextFormField passwordTextForm(TextEditingController psd) {
    return TextFormField(
      controller: psd,
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
            errors.remove(kInvalidEmailNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return '';
        } else if (!emailValidator.hasMatch(value) &&
            !errors.contains(kInvalidEmailNullError)) {
          setState(() {
            errors.add(kInvalidEmailNullError);
          });
          return '';
        }
      },
    );
  }
}
