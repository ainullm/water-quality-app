import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/modules/check_water_quality/views/check_water_quality_view.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.isRegistered<NavigationController>()
      ? Get.find()
      : Get.put(NavigationController());
  var currentIndex = 0;

  List<Widget> listBody = [
    const HomeView(),
    const CheckWaterQualityView(),
    const ProfileView()
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
