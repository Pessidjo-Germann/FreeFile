import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const Spacer(),
          const Text(
            "FreeFile",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          const Spacer(),
          // IconButton(
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //   },
          //   icon: const Icon(Icons.logout_outlined),
          // )
        ],
      ),
    );
  }
}
