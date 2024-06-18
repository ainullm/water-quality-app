import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    nextScreen();
  }

  void nextScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {
      log('Splash Screen');
      Get.offNamed(Routes.NAVIGATION);
    });
  }
}
