import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_text_style.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      bottomNavigationBar: Container(
        color: black2,
        padding: const EdgeInsets.all(5),
        child: Text(
          '© 2024 Aquaculture PENS',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: white,
              ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'AQPENS',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width * 0.7,
              child: Text(
                'Penerapan Teknologi Elektro untuk Teknologi Akuakultur',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
