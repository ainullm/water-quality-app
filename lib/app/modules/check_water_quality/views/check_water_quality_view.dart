import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/repositories/water_quality_repositories.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/images_utils.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/widgets/text_field_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../shared/utils/button_utils.dart';
import '../controllers/check_water_quality_controller.dart';

class CheckWaterQualityView extends GetView<CheckWaterQualityController> {
  const CheckWaterQualityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CheckWaterQualityController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            controller: controller.scrollController,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Water Quality Check',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: primaryColor),
                  ),
                  AppImage.svg(
                    'ic-document-bulk',
                    color: primaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: black2.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              'Input value of water quality parameter',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          AppImage.svg(
                            'ic-information',
                            color: black2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextFieldWidget(
                        keyboardType: TextInputType.number,
                        // colorBackground: blueShade,
                        colorOnFocus: blue,
                        colorOffFocus: blueShade,
                        hintText: 'Disolved Oxygen (DO)',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: blue.withOpacity(0.9)),
                      ),
                      MyTextFieldWidget(
                        keyboardType: TextInputType.number,
                        // colorBackground: redShade,
                        colorOnFocus: red,
                        colorOffFocus: redShade,
                        hintText: 'pH',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: red.withOpacity(0.9)),
                      ),
                      MyTextFieldWidget(
                        keyboardType: TextInputType.number,
                        // colorBackground: purpleShade,
                        colorOnFocus: purple,
                        colorOffFocus: purpleShade,
                        hintText: 'Salinity',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: purple.withOpacity(0.9)),
                      ),
                      MyTextFieldWidget(
                        keyboardType: TextInputType.number,
                        // colorBackground: orangeShade,
                        colorOnFocus: orange,
                        colorOffFocus: orangeShade,
                        hintText: 'Temperature',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: orange.withOpacity(0.9)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton.fill(
                        context: context,
                        text: 'Check Water Quality',
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: white),
                        onTap: () {
                          controller.checkWater().then((value) {
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              if (controller.quality.value.isNotEmpty) {
                                controller.scrollController.animateTo(
                                  controller.scrollController.position
                                      .maxScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            });
                          });
                          // controller.scrollController.animateTo(
                          //   controller
                          //       .scrollController.position.maxScrollExtent,
                          //   duration: const Duration(milliseconds: 500),
                          //   curve: Curves.ease,
                          // );
                          // WaterQualityRepositories().getWaterQualityCheck();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.quality.value.isEmpty
                    ? const SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Result',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.resetParameters();
                                },
                                child: const Icon(
                                  Icons.delete_forever_outlined,
                                  color: red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Disolved Oxygen',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '${controller.dissolvedOxygen.value} mg/L',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: controller.checkDoColor()),
                                    ),
                                  ],
                                ),
                                SfLinearGauge(
                                  // showTicks: false,
                                  // useRangeColorForAxis: true,
                                  animateAxis: true,
                                  interval: 2,
                                  axisTrackStyle:
                                      const LinearAxisTrackStyle(thickness: 1),
                                  maximum: 10,
                                  showAxisTrack: true,
                                  ranges: const [
                                    LinearGaugeRange(
                                      startValue: 0,
                                      endValue: 4,
                                      position: LinearElementPosition.outside,
                                      color: red2,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 4,
                                      endValue: 6,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 6,
                                      endValue: 10,
                                      position: LinearElementPosition.outside,
                                      color: green,
                                    ),
                                  ],
                                  markerPointers: [
                                    LinearShapePointer(
                                      value: controller.dissolvedOxygen.value,
                                      shapeType: LinearShapePointerType.circle,
                                      elevation: 1,
                                      elevationColor: Colors.blueGrey,
                                      color: black1,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'pH',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '${controller.ph.value}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: controller.checkPhColor()),
                                    ),
                                  ],
                                ),
                                SfLinearGauge(
                                  // showTicks: false,
                                  // minorTicksPerInterval: 2,
                                  // useRangeColorForAxis: true,
                                  animateAxis: true,
                                  interval: 0.5,
                                  axisTrackStyle:
                                      const LinearAxisTrackStyle(thickness: 1),
                                  minimum: 6,
                                  maximum: 10,
                                  axisLabelStyle:
                                      const TextStyle(color: black1),
                                  ranges: const [
                                    LinearGaugeRange(
                                      startValue: 0,
                                      endValue: 6.5,
                                      position: LinearElementPosition.outside,
                                      color: red2,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 6.5,
                                      endValue: 7.5,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 7.5,
                                      endValue: 8.5,
                                      position: LinearElementPosition.outside,
                                      color: green,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 8.5,
                                      endValue: 9.5,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 9.5,
                                      endValue: 14,
                                      position: LinearElementPosition.outside,
                                      color: Color(0xffF45656),
                                    ),
                                  ],
                                  markerPointers: [
                                    LinearShapePointer(
                                      value: controller.ph.value,
                                      shapeType: LinearShapePointerType.circle,
                                      elevation: 1,
                                      elevationColor: Colors.blueGrey,
                                      color: black1,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Salinity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '${controller.salinity.value} ppt',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color:
                                                controller.checkSalinityColor(),
                                          ),
                                    ),
                                  ],
                                ),
                                SfLinearGauge(
                                  // showTicks: false,
                                  // minorTicksPerInterval: 2,
                                  // useRangeColorForAxis: true,
                                  animateAxis: true,
                                  interval: 5,
                                  axisTrackStyle:
                                      const LinearAxisTrackStyle(thickness: 1),
                                  minimum: -5,
                                  maximum: 40,
                                  axisLabelStyle:
                                      const TextStyle(color: black1),
                                  ranges: const [
                                    LinearGaugeRange(
                                      startValue: -5,
                                      endValue: 0,
                                      position: LinearElementPosition.outside,
                                      color: red2,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 0,
                                      endValue: 15,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 15,
                                      endValue: 30,
                                      position: LinearElementPosition.outside,
                                      color: green,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 30,
                                      endValue: 35,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 35,
                                      endValue: 40,
                                      position: LinearElementPosition.outside,
                                      color: red2,
                                    ),
                                  ],
                                  markerPointers: [
                                    LinearShapePointer(
                                      value: controller.salinity.value,
                                      shapeType: LinearShapePointerType.circle,
                                      elevation: 1,
                                      elevationColor: Colors.blueGrey,
                                      color: black1,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Temperature',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '${controller.temperature.value} °C',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: controller
                                                .checkTemperatureColor(),
                                          ),
                                    ),
                                  ],
                                ),
                                SfLinearGauge(
                                  // showTicks: false,
                                  // minorTicksPerInterval: 2,
                                  // useRangeColorForAxis: true,
                                  animateAxis: true,
                                  interval: 5,
                                  axisTrackStyle:
                                      const LinearAxisTrackStyle(thickness: 1),
                                  minimum: 20,
                                  maximum: 40,
                                  axisLabelStyle:
                                      const TextStyle(color: black1),
                                  ranges: const [
                                    LinearGaugeRange(
                                      startValue: 0,
                                      endValue: 26,
                                      position: LinearElementPosition.outside,
                                      color: red2,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 26,
                                      endValue: 28,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 28,
                                      endValue: 32,
                                      position: LinearElementPosition.outside,
                                      color: green,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 32,
                                      endValue: 35,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                    ),
                                    LinearGaugeRange(
                                      startValue: 35,
                                      endValue: 40,
                                      position: LinearElementPosition.outside,
                                      color: Color(0xffF45656),
                                    ),
                                  ],
                                  markerPointers: [
                                    LinearShapePointer(
                                      value: controller.temperature.value,
                                      shapeType: LinearShapePointerType.circle,
                                      elevation: 1,
                                      elevationColor: Colors.blueGrey,
                                      color: black1,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Overall Water Quality',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SfLinearGauge(
                                  showTicks: false,
                                  minorTicksPerInterval: 2,
                                  useRangeColorForAxis: true,
                                  animateAxis: true,
                                  axisTrackStyle:
                                      const LinearAxisTrackStyle(thickness: 1),
                                  showLabels: false,
                                  maximum: 1,
                                  axisLabelStyle:
                                      const TextStyle(color: black1),
                                  ranges: [
                                    LinearGaugeRange(
                                      startValue: 0,
                                      endValue: 0.33,
                                      color: const Color(0xffF45656),
                                      startWidth: 30,
                                      endWidth: 30,
                                      child: Center(
                                        child: Text(
                                          'Poor',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(color: white),
                                        ),
                                      ),
                                    ),
                                    LinearGaugeRange(
                                      startValue: 0.33,
                                      endValue: 0.67,
                                      position: LinearElementPosition.outside,
                                      color: yellow,
                                      startWidth: 30,
                                      endWidth: 30,
                                      child: Center(
                                        child: Text(
                                          'Medium',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(color: black2),
                                        ),
                                      ),
                                    ),
                                    LinearGaugeRange(
                                      startValue: 0.67,
                                      endValue: 1,
                                      position: LinearElementPosition.outside,
                                      color: green,
                                      startWidth: 30,
                                      endWidth: 30,
                                      child: Center(
                                        child: Text(
                                          'Good',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(color: white),
                                        ),
                                      ),
                                    ),
                                  ],
                                  markerPointers: [
                                    LinearShapePointer(
                                      value: controller.wsmValue.value,
                                      shapeType:
                                          LinearShapePointerType.triangle,
                                      position: LinearElementPosition.inside,
                                      elevation: 1,
                                      color: black1,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
