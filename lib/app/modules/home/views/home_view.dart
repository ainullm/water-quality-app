import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/button_utils.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/images_utils.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/widgets/history_calculate_widget.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/widgets/parameter_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
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
                    const SizedBox(height: 30),
                    // Container(
                    //   width: Get.width,
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: primaryColor.withOpacity(0.1),
                    //   ),
                    //   child: Text(
                    //     'Optimal Range Water Quality',
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .titleMedium
                    //         ?.copyWith(color: black1),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
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
                      children: const [
                        MyParameterWidget(
                          icon: 'ic-oxygen',
                          title: 'Disolved Oxygen',
                          value: '8',
                          paramValue: 'mg/L',
                          textColor: blue,
                          cardColor: blueShade,
                        ),
                        MyParameterWidget(
                          icon: 'ic-ph',
                          title: 'Potential Hydrogen',
                          value: '7.2',
                          textColor: red,
                          cardColor: redShade,
                        ),
                        MyParameterWidget(
                          icon: 'ic-salinity',
                          title: 'Salinity',
                          value: '30',
                          paramValue: 'ppt',
                          textColor: purple,
                          cardColor: purpleShade,
                        ),
                        MyParameterWidget(
                          icon: 'ic-temp',
                          title: 'Temperature',
                          value: '28',
                          paramValue: '°C',
                          textColor: orange,
                          cardColor: orangeShade,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    Text(
                      'About Aquaculture ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      height: 10,
                    ),
                    Text(
                      'Aquaculture is the farming of fish, crustaceans, molluscs, aquatic plants, algae, and other organisms. Aquaculture involves cultivating freshwater and saltwater populations under controlled conditions, and can be contrasted with commercial fishing, which is the harvesting of wild fish.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                    // Text(
                    //   'History Water Quality',
                    //   style: Theme.of(context).textTheme.titleMedium,
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // SizedBox(
                    //   height: 400,
                    //   child: ListView.separated(
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) {
                    //       return const MyHistoryCalculateWidget();
                    //     },
                    //     separatorBuilder: (context, index) {
                    //       return const SizedBox(height: 10);
                    //     },
                    //     itemCount: 3,
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
