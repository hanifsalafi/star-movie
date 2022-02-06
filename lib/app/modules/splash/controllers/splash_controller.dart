import 'dart:async';

import 'package:get/get.dart';
import 'package:starmovie/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    splashScreenStart();
  }

  @override
  void onReady() {
    super.onReady();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
