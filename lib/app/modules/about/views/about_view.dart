import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/images_utils.dart';

import '../../../models/about_model.dart';
import '../../../shared/styles/app_colors.dart';
import '../../../shared/utils/appbar_utils.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.none(
        title: Text(
          'Tentang Aplikasi',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: black2,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AppImage.jpg(
                  'foto-1',
                  width: Get.width,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'TISASforINA adalah sebuah platform digital yang dibangun dengan tujuan untuk mendukung penguatan sektor budidaya perairan (akuakultur) Indonesia yang maju dan mandiri. Platform ini dibangun oleh tim Riset Grup Aquacultural Engineering Applied Technology (ACE App-Tech) Politeknik Elektronika Negeri Surabaya dan didanai oleh Direktorat Jenderal Pendidikan Vokasi, Kementerian Pendidikan dan Kebudayaan, Riset dan Teknologi, Republik Indonesia yang dikelola oleh Lembaga Pengelolaan Dana Pendidikan (LPDP) .',
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: black2),
            )
          ],
        ),
      ),
    );
  }
}
