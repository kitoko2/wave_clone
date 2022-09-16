import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var montantShow = true.obs;
  final count = 0.obs;
  var numberConnected = "".obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getNumberOfConnected();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getNumberOfConnected() async {
    final prefs = await SharedPreferences.getInstance();

    numberConnected.value = prefs.getString("number") ?? "0990909090";
  }

  void increment() => count.value++;
}
