import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/routes/app_pages.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/images_utils.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/widgets/menu_button_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: black1.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    blue,
                    primaryColor,
                  ],
                ),
              ),
              height: 260,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppImage.png('im-profile', width: 80),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ainul M',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'User ID: 123456',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  MyMenuButtonWidget(
                    icon: AppImage.svg(
                      'ic-profile',
                      color: black1.withOpacity(0.5),
                    ),
                    text: 'Akun Saya',
                  ),
                  // MyMenuButtonWidget(
                  //   icon: AppImage.svg(
                  //     'ic-device',
                  //     color: black1.withOpacity(0.5),
                  //   ),
                  //   text: 'Perangkat Saya',
                  // ),
                  MyMenuButtonWidget(
                    onTap: () {
                      Get.toNamed(Routes.SPONSORSHIP);
                    },
                    icon: AppImage.svg(
                      'ic-sponsored',
                      color: black1.withOpacity(0.5),
                    ),
                    text: 'Didukung Oleh',
                  ),
                  MyMenuButtonWidget(
                    icon: AppImage.svg(
                      'ic-settings-2',
                      color: black1.withOpacity(0.5),
                    ),
                    text: 'Pengaturan',
                  ),
                  MyMenuButtonWidget(
                    onTap: () {
                      Get.toNamed(Routes.ABOUT);
                    },
                    icon: AppImage.svg(
                      'ic-about-bold',
                      color: black1.withOpacity(0.5),
                    ),
                    text: 'Tentang Aplikasi',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyMenuButtonWidget(
                    icon: AppImage.svg(
                      'ic-logout',
                      color: red,
                    ),
                    text: 'Keluar',
                    textColor: red,
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aquaculture PENS © 2024',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: black2.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
