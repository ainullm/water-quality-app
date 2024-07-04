import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/styles/app_colors.dart';
import '../../../shared/utils/images_utils.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      // bottomNavigationBar: Container(
      //   color: black2,
      //   padding: const EdgeInsets.all(5),
      //   child: Text(
      //     '© 2024 Aquaculture PENS',
      //     textAlign: TextAlign.center,
      //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
      //           color: white,
      //         ),
      //   ),
      // ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondaryColor,
              primaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.37),
            AppImage.svg(
              'ic-logo',
              width: 80,
              height: 80,
              color: white,
            ),
            const SizedBox(height: 15),
            Text(
              'AQPENS',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // SizedBox(
            //   width: Get.width * 0.7,
            //   child: Text(
            //     'Penerapan Teknologi Elektro untuk Teknologi Akuakultur',
            //     textAlign: TextAlign.center,
            //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //           color: white,
            //         ),
            //   ),
            // ),
            SizedBox(height: Get.height * 0.36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage.png('pens', width: 25, height: 25),
                const SizedBox(width: 15),
                Text(
                  'Aquaculture PENS',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: white,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
