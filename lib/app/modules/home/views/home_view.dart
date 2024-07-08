import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/button_utils.dart';

import '../../../shared/styles/app_colors.dart';
import '../../../shared/utils/images_utils.dart';
import '../../../shared/widgets/parameter_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        Timer.periodic(const Duration(seconds: 10), (timer) {
          _.getMonitoringData();
        });
        return Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Hallo, ',
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: [
                              TextSpan(
                                text: 'Ainul M',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                        AppImage.png('im-profile', width: 45, height: 45),
                      ],
                    ),
                    const SizedBox(height: 40),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      children: [
                        Obx(() => MyParameterWidget(
                              icon: 'ic-oxygen',
                              title: 'Disolved Oxygen',
                              value: _.dissolvedOxygen.value != 0
                                  ? double.parse(
                                          _.dissolvedOxygen.value.toString())
                                      .toStringAsFixed(2)
                                  : '--',
                              paramValue: 'mg/L',
                              textColor: blue,
                              cardColor: blueShade,
                            )),
                        Obx(() => MyParameterWidget(
                              icon: 'ic-ph',
                              title: 'Potential Hydrogen',
                              value: _.ph.value != 0
                                  ? double.parse(_.ph.value.toString())
                                      .toStringAsFixed(2)
                                  : '--',
                              textColor: red,
                              cardColor: redShade,
                            )),
                        Obx(() => MyParameterWidget(
                              icon: 'ic-salinity',
                              title: 'Salinity',
                              value: _.salinity.value != 0
                                  ? double.parse(_.salinity.value.toString())
                                      .toStringAsFixed(2)
                                  : '--',
                              paramValue: 'ppt',
                              textColor: purple,
                              cardColor: purpleShade,
                            )),
                        Obx(() => MyParameterWidget(
                              icon: 'ic-temp',
                              title: 'Temperature',
                              value: _.temperature.value != 0
                                  ? double.parse(_.temperature.value.toString())
                                      .toStringAsFixed(2)
                                  : '--',
                              paramValue: '°C',
                              textColor: orange,
                              cardColor: orangeShade,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Coming Soon',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteGrey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: black1.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppImage.png(
                            'monitoring',
                            width: Get.width * 0.25,
                          ),
                          SizedBox(
                            width: Get.width * 0.5,
                            child: Text(
                              'Next Feature is monitoring water quality in real time. Stay tuned!',
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: black2.withOpacity(0.5)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Container(
                    //   padding: const EdgeInsets.all(20),
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: whiteGrey,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Kualitas Parameter Air',
                    //         style: Theme.of(context).textTheme.titleMedium,
                    //       ),
                    //       const SizedBox(
                    //         height: 20,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
