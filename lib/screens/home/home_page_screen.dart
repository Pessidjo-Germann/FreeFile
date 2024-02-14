import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:free_files/constante.dart';
import 'package:free_files/screens/home/components/body.dart';

class Home extends StatelessWidget {
  static String routeName = "/home";
  Home({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FreeFile",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: kDartColor,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const Padding(
                padding: EdgeInsets.only(left: 68.0),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                ),
              ),
              accountName: const Text("Germann"),
              accountEmail: Text("user!.email.toString()"),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 184, 142, 17),
              ),
            ),
            Spacer(),
            const Text("Cette partie n'est pas encore disponible!"),
            Spacer(),
          ],
        ),
      ),
      body: const Body(),
    );
  }
}
