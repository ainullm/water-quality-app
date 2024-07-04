import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/about_model.dart';
import '../../../shared/styles/app_colors.dart';
import '../../../shared/utils/appbar_utils.dart';
import '../../../shared/utils/images_utils.dart';
import '../controllers/sponsorship_controller.dart';

class SponsorshipView extends GetView<SponsorshipController> {
  const SponsorshipView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.none(
        title: Text(
          'Didukung Oleh',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: black2,
              ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          CarouselSlider.builder(
            itemCount: aboutDummyModel.length,
            options: CarouselOptions(
              disableCenter: true,
              clipBehavior: Clip.none,
              viewportFraction: 0.4,
              enlargeCenterPage: true,
              aspectRatio: 2.7,
              autoPlay: true,
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) => controller.setImageIndex(index),
            ),
            itemBuilder: (context, index, realIndex) {
              final data = aboutDummyModel[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppImage.png(
                      data.image!,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Text(
                  //   data.title!,
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleLarge!
                  //       .copyWith(color: black2),
                  // ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Dengan dukungan penuh dari PENS, PLDP, Kemendikbud, Aquaculture PENS, dan Mitras DUDI, kami dengan bangga mengembangkan aplikasi kualitas air yang inovatif. Aplikasi ini dirancang khusus untuk mendukung budidaya udang vaname, dengan tujuan meningkatkan efisiensi, produktivitas, dan keberlanjutan dalam industri akuakultur. Dukungan yang kami terima memungkinkan kami untuk menerapkan teknologi terbaru dan praktik terbaik, memastikan bahwa setiap aspek budidaya udang vaname dapat dioptimalkan. Terima kasih kepada semua pihak yang telah mendukung inisiatif ini, kami yakin bahwa aplikasi ini akan membawa dampak positif yang signifikan bagi para petani udang dan industri akuakultur secara keseluruhan.',
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: black2),
            ),
          )
        ],
      ),
    );
  }
}
