import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/styles/app_colors.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/utils/images_utils.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/shared/widgets/text_field_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../shared/utils/app_snackbar.dart';
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
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //   width: 1,
                    //   color: black2.withOpacity(0.2),
                    // ),
                    boxShadow: [
                      BoxShadow(
                        color: black2.withOpacity(0.15),
                        blurRadius: 10,
                      ),
                    ],
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
                        controller: controller.doController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 50,
                        ),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'mg/L',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: blue.withOpacity(0.9)),
                          ),
                        ),
                        // colorBackground: blueShade,
                        colorOnFocus: blue,
                        colorOffFocus: blueShade,
                        hintText: 'Disolved Oxygen (DO)',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a DO value';
                          }
                          return null;
                        },
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: black2),
                      ),
                      MyTextFieldWidget(
                        controller: controller.phController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // colorBackground: redShade,
                        colorOnFocus: red,
                        colorOffFocus: redShade,
                        hintText: 'pH',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a pH value';
                          }
                          return null;
                        },
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: black2),
                      ),
                      MyTextFieldWidget(
                        controller: controller.salinityController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // colorBackground: purpleShade,
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'ppt',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: purple.withOpacity(0.9)),
                          ),
                        ),
                        colorOnFocus: purple,
                        colorOffFocus: purpleShade,
                        hintText: 'Salinity',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a salinity value';
                          }
                          return null;
                        },
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: black2),
                      ),
                      MyTextFieldWidget(
                        controller: controller.temperatureController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 35,
                        ),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            '°C',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: orange.withOpacity(0.9)),
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          controller.checkWater(
                            {
                              'do': double.parse(controller.doController.text),
                              'ph': double.parse(controller.phController.text),
                              'suhu': double.parse(
                                  controller.temperatureController.text),
                              'salinitas': double.parse(
                                  controller.salinityController.text),
                            },
                          ).then((value) {
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
                        },
                        // colorBackground: orangeShade,
                        colorOnFocus: orange,
                        colorOffFocus: orangeShade,
                        hintText: 'Temperature',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a temperature value';
                          }
                          return null;
                        },
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: black2),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton.fill(
                        context: context,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            blue,
                            primaryColor,
                          ],
                        ),
                        text: 'Check Water Quality',
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: white),
                        onTap: () {
                          if (controller.doController.text.isEmpty ||
                              controller.phController.text.isEmpty ||
                              controller.salinityController.text.isEmpty ||
                              controller.temperatureController.text.isEmpty) {
                            AppSnackbar.failure(
                                title: 'Failed!',
                                subtitle: 'Please fill all the fields');
                          } else {
                            controller.checkWater({
                              'do': double.parse(controller.doController.text),
                              'ph': double.parse(controller.phController.text),
                              'suhu': double.parse(
                                  controller.temperatureController.text),
                              'salinitas': double.parse(
                                  controller.salinityController.text),
                            }).then((value) {
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
                          }

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
                () {
                  return controller.quality.value.isEmpty
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
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                    color: red2,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.55,
                                  height: 270,
                                  child: SfRadialGauge(
                                    enableLoadingAnimation: true,
                                    animationDuration: 2000,
                                    axes: [
                                      RadialAxis(
                                        annotations: [
                                          GaugeAnnotation(
                                            widget: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Water Quality',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        color: grey,
                                                      ),
                                                ),
                                                Text(
                                                  controller.quality.value,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                        color: controller
                                                            .checkQualityColor(),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                        axisLineStyle: AxisLineStyle(
                                          thickness: 0.1,
                                          color: grey.withOpacity(0.25),
                                          thicknessUnit: GaugeSizeUnit.factor,
                                        ),
                                        showTicks: false,
                                        startAngle: 270,
                                        endAngle: 270,
                                        minimum: 0,
                                        maximum: 1,
                                        showLabels: false,
                                        pointers: [
                                          RangePointer(
                                            value: controller.wsmValue.value,
                                            width: 0.1,
                                            sizeUnit: GaugeSizeUnit.factor,
                                            cornerStyle: CornerStyle.bothCurve,
                                            gradient: const SweepGradient(
                                              colors: [
                                                primaryColor,
                                                secondaryColor,
                                              ],
                                              stops: [0.25, 0.75],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Disolved Oxygen :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: black2),
                                        ),
                                        Text(
                                          '${controller.doController.text} mg/L',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color:
                                                    controller.checkDoColor(),
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'pH :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: black2),
                                        ),
                                        Text(
                                          controller.phController.text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color:
                                                    controller.checkPhColor(),
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Salinity :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: black2,
                                              ),
                                        ),
                                        Text(
                                          '${controller.salinityController.text} ppt',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color: controller
                                                    .checkSalinityColor(),
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Temperature :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: black2,
                                              ),
                                        ),
                                        Text(
                                          '${controller.temperatureController.text} °C',
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
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                },
              )

              // Obx(
              //   () => controller.quality.value.isEmpty
              //       ? const SizedBox()
              //       : Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Result',
              //                   style: Theme.of(context).textTheme.titleMedium,
              //                 ),
              //                 const SizedBox(
              //                   width: 10,
              //                 ),
              //                 GestureDetector(
              //                   onTap: () {
              //                     controller.resetParameters();
              //                   },
              //                   child: const Icon(
              //                     Icons.delete_forever_outlined,
              //                     color: red,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 20,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.symmetric(horizontal: 20),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         'Disolved Oxygen',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .bodyMedium,
              //                       ),
              //                       Text(
              //                         '${controller.doController.text} mg/L',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall
              //                             ?.copyWith(
              //                                 color: controller.checkDoColor()),
              //                       ),
              //                     ],
              //                   ),
              //                   SfLinearGauge(
              //                     // showTicks: false,
              //                     // useRangeColorForAxis: true,
              //                     animateAxis: true,
              //                     interval: 2,
              //                     axisTrackStyle:
              //                         const LinearAxisTrackStyle(thickness: 1),
              //                     maximum: 10,
              //                     showAxisTrack: true,
              //                     ranges: const [
              //                       LinearGaugeRange(
              //                         startValue: 0,
              //                         endValue: 3,
              //                         position: LinearElementPosition.outside,
              //                         color: red2,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 3,
              //                         endValue: 4,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 4,
              //                         endValue: 10,
              //                         position: LinearElementPosition.outside,
              //                         color: green,
              //                       ),
              //                     ],
              //                     markerPointers: [
              //                       LinearShapePointer(
              //                         value: double.parse(
              //                             controller.doController.text),
              //                         shapeType: LinearShapePointerType.circle,
              //                         elevation: 1,
              //                         elevationColor: Colors.blueGrey,
              //                         color: black1,
              //                       )
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     height: 30,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         'pH',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .bodyMedium,
              //                       ),
              //                       Text(
              //                         controller.phController.text,
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall
              //                             ?.copyWith(
              //                                 color: controller.checkPhColor()),
              //                       ),
              //                     ],
              //                   ),
              //                   SfLinearGauge(
              //                     // showTicks: false,
              //                     // minorTicksPerInterval: 2,
              //                     // useRangeColorForAxis: true,
              //                     animateAxis: true,
              //                     interval: 0.5,
              //                     axisTrackStyle:
              //                         const LinearAxisTrackStyle(thickness: 1),
              //                     minimum: 6,
              //                     maximum: 10,
              //                     axisLabelStyle:
              //                         const TextStyle(color: black1),
              //                     ranges: const [
              //                       LinearGaugeRange(
              //                         startValue: 0,
              //                         endValue: 7,
              //                         position: LinearElementPosition.outside,
              //                         color: red2,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 7,
              //                         endValue: 7.5,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 7.5,
              //                         endValue: 8.5,
              //                         position: LinearElementPosition.outside,
              //                         color: green,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 8.5,
              //                         endValue: 9,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 9,
              //                         endValue: 14,
              //                         position: LinearElementPosition.outside,
              //                         color: Color(0xffF45656),
              //                       ),
              //                     ],
              //                     markerPointers: [
              //                       LinearShapePointer(
              //                         value: double.parse(
              //                             controller.phController.text),
              //                         shapeType: LinearShapePointerType.circle,
              //                         elevation: 1,
              //                         elevationColor: Colors.blueGrey,
              //                         color: black1,
              //                       )
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     height: 30,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         'Salinity',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .bodyMedium,
              //                       ),
              //                       Text(
              //                         '${controller.salinityController.text} ppt',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall
              //                             ?.copyWith(
              //                               color:
              //                                   controller.checkSalinityColor(),
              //                             ),
              //                       ),
              //                     ],
              //                   ),
              //                   SfLinearGauge(
              //                     // showTicks: false,
              //                     // minorTicksPerInterval: 2,
              //                     // useRangeColorForAxis: true,
              //                     animateAxis: true,
              //                     interval: 5,
              //                     axisTrackStyle:
              //                         const LinearAxisTrackStyle(thickness: 1),
              //                     minimum: 0,
              //                     maximum: 50,
              //                     axisLabelStyle:
              //                         const TextStyle(color: black1),
              //                     ranges: const [
              //                       LinearGaugeRange(
              //                         startValue: 0,
              //                         endValue: 5,
              //                         position: LinearElementPosition.outside,
              //                         color: red2,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 5,
              //                         endValue: 26,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 26,
              //                         endValue: 32,
              //                         position: LinearElementPosition.outside,
              //                         color: green,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 32,
              //                         endValue: 40,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 40,
              //                         endValue: 50,
              //                         position: LinearElementPosition.outside,
              //                         color: red2,
              //                       ),
              //                     ],
              //                     markerPointers: [
              //                       LinearShapePointer(
              //                         value: double.parse(
              //                           controller.salinityController.text,
              //                         ),
              //                         shapeType: LinearShapePointerType.circle,
              //                         elevation: 1,
              //                         elevationColor: Colors.blueGrey,
              //                         color: black1,
              //                       )
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     height: 30,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment:
              //                         MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(
              //                         'Temperature',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .bodyMedium,
              //                       ),
              //                       Text(
              //                         '${controller.temperatureController.text} °C',
              //                         style: Theme.of(context)
              //                             .textTheme
              //                             .titleSmall
              //                             ?.copyWith(
              //                               color: controller
              //                                   .checkTemperatureColor(),
              //                             ),
              //                       ),
              //                     ],
              //                   ),
              //                   SfLinearGauge(
              //                     // showTicks: false,
              //                     // minorTicksPerInterval: 2,
              //                     // useRangeColorForAxis: true,
              //                     animateAxis: true,
              //                     interval: 5,
              //                     axisTrackStyle:
              //                         const LinearAxisTrackStyle(thickness: 1),
              //                     minimum: 20,
              //                     maximum: 40,
              //                     axisLabelStyle:
              //                         const TextStyle(color: black1),
              //                     ranges: const [
              //                       LinearGaugeRange(
              //                         startValue: 0,
              //                         endValue: 26,
              //                         position: LinearElementPosition.outside,
              //                         color: red2,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 26,
              //                         endValue: 28,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 28,
              //                         endValue: 32,
              //                         position: LinearElementPosition.outside,
              //                         color: green,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 32,
              //                         endValue: 34,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 34,
              //                         endValue: 40,
              //                         position: LinearElementPosition.outside,
              //                         color: red2,
              //                       ),
              //                     ],
              //                     markerPointers: [
              //                       LinearShapePointer(
              //                         value: double.parse(
              //                           controller.temperatureController.text,
              //                         ),
              //                         shapeType: LinearShapePointerType.circle,
              //                         elevation: 1,
              //                         elevationColor: Colors.blueGrey,
              //                         color: black1,
              //                       )
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     height: 50,
              //                   ),
              //                   Text(
              //                     'Overall Water Quality',
              //                     style: Theme.of(context).textTheme.bodyMedium,
              //                   ),
              //                   const SizedBox(
              //                     height: 20,
              //                   ),
              //                   SfLinearGauge(
              //                     showTicks: false,
              //                     minorTicksPerInterval: 2,
              //                     useRangeColorForAxis: true,
              //                     animateAxis: true,
              //                     axisTrackStyle:
              //                         const LinearAxisTrackStyle(thickness: 1),
              //                     showLabels: false,
              //                     maximum: 1,
              //                     axisLabelStyle:
              //                         const TextStyle(color: black1),
              //                     ranges: [
              //                       LinearGaugeRange(
              //                         startValue: 0,
              //                         endValue: 0.33,
              //                         color: const Color(0xffF45656),
              //                         startWidth: 30,
              //                         endWidth: 30,
              //                         child: Center(
              //                           child: Text(
              //                             'Poor',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleSmall
              //                                 ?.copyWith(color: white),
              //                           ),
              //                         ),
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 0.33,
              //                         endValue: 0.67,
              //                         position: LinearElementPosition.outside,
              //                         color: yellow,
              //                         startWidth: 30,
              //                         endWidth: 30,
              //                         child: Center(
              //                           child: Text(
              //                             'Medium',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleSmall
              //                                 ?.copyWith(color: black2),
              //                           ),
              //                         ),
              //                       ),
              //                       LinearGaugeRange(
              //                         startValue: 0.67,
              //                         endValue: 1,
              //                         position: LinearElementPosition.outside,
              //                         color: green,
              //                         startWidth: 30,
              //                         endWidth: 30,
              //                         child: Center(
              //                           child: Text(
              //                             'Good',
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .titleSmall
              //                                 ?.copyWith(color: white),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                     markerPointers: [
              //                       LinearShapePointer(
              //                         value: controller.wsmValue.value,
              //                         shapeType:
              //                             LinearShapePointerType.triangle,
              //                         position: LinearElementPosition.inside,
              //                         elevation: 1,
              //                         color: black1,
              //                       )
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     height: 30,
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
