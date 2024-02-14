import 'package:flutter/material.dart';
import 'package:free_files/constante.dart';
import 'package:free_files/controller/count_controller.dart';
import 'package:get/get.dart';

class CreditBox extends StatelessWidget {
  const CreditBox({
    super.key,
    required this.size,
    required this.credit,
  });

  final Size size;
  final int credit;
  @override
  Widget build(BuildContext context) {
    final c = Get.put(CountCredit());
    return Container(
      width: size.width * 0.8,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white30,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Text(
            "Nombre de Crédit : ",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.white30),
          ),
          Obx(
            () => Text(c.credit.toString(),
                textScaleFactor: 1.2, style: TextStyle(color: Colors.white30)),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                information(context);
              },
              icon: Icon(Icons.add_box)),
        ],
      ),
    );
  }
}
