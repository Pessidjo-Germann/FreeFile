import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  static String routeName = "/drawer";
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        //width: 270,
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
              accountEmail: Text('user!.email.toString()'),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 184, 142, 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
