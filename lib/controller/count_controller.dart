import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountCredit extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    obtenir();
  }

  var credit = 20.obs;
  onAdd() async {
    credit += 10;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('credit', credit.value);
    obtenir();
  }

  onUpdate(val) {
    val = credit.toInt();
  }

  onSet(val) {
    credit = val;
  }

  onDeletes() async {
    if (credit.value < 20) {
      credit.value = credit.value;
    } else {
      credit.value -= 20;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('credit', credit.value);
    obtenir();
  }

  Future<void> obtenir() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedCredit = prefs.getInt('credit') ?? 20;
    credit.value = savedCredit;
  }
}
