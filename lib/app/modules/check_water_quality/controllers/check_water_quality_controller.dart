import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide Response;

import '../../../repositories/water_quality_repositories.dart';
import '../../../shared/styles/app_colors.dart';

class CheckWaterQualityController extends GetxController {
  var quality = ''.obs;
  // var weights = [].obs;
  var wsmValue = 0.0.obs;
  // var ph = 0.0.obs;
  // var salinity = 0.0.obs;
  // var temperature = 0.0.obs;
  // var dissolvedOxygen = 0.0.obs;
  TextEditingController doController = TextEditingController();
  TextEditingController phController = TextEditingController();
  TextEditingController salinityController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  ScrollController scrollController = ScrollController();

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  Future<void> getThreshold() async {
    try {
      final resp = await WaterQualityRepositories().getThresholds();
    } catch (e) {
      e.toString();
    }
  }

  Future<Response?> checkWater(input) async {
    try {
      final resp = await WaterQualityRepositories().waterQualityCheck(input);
      if (resp != null && resp.statusCode == 200) {
        quality.value = resp.data['quality'];
        wsmValue.value = resp.data['wsm'];
      } else {
        resetParameters();
      }
      return resp;
    } catch (e) {
      log('Error: $e');
      // Reset all parameters in case of error
      resetParameters();
    }
    log('Quality: ${quality.value}');
    // log('Weights: $weights');
    log('WSM Value: ${wsmValue.value}');
    return null;
    // log('pH: ${ph.value}');
    // log('Salinity: ${salinity.value}');
    // log('Temperature: ${temperature.value}');
    // log('Dissolved Oxygen: ${dissolvedOxygen.value}');
  }

  void resetParameters() {
    quality.value = '';
    // weights.clear();
    wsmValue.value = 0.0;
    phController.clear();
    salinityController.clear();
    temperatureController.clear();
    doController.clear();
  }

  checkDoColor() {
    if (double.parse(doController.text) < 3) {
      return red;
    } else if (double.parse(doController.text) >= 3 &&
        double.parse(doController.text) < 4) {
      return yellow;
    } else {
      return green;
    }
  }

  checkPhColor() {
    if (double.parse(phController.text) < 7 ||
        double.parse(phController.text) > 9) {
      return red;
    } else if (double.parse(phController.text) >= 7 &&
            double.parse(phController.text) < 7.5 ||
        double.parse(phController.text) > 8.5 &&
            double.parse(phController.text) <= 9) {
      return yellow;
    } else {
      return green;
    }
  }

  checkSalinityColor() {
    if (double.parse(salinityController.text) < 0 ||
        double.parse(salinityController.text) > 40) {
      return red;
    } else if (double.parse(salinityController.text) >= 5 &&
            double.parse(salinityController.text) < 26 ||
        double.parse(salinityController.text) > 32 &&
            double.parse(salinityController.text) <= 40) {
      return yellow;
    } else {
      return green;
    }
  }

  checkTemperatureColor() {
    if (double.parse(temperatureController.text) < 26 ||
        double.parse(temperatureController.text) > 35) {
      return red;
    } else if (double.parse(temperatureController.text) >= 26 &&
            double.parse(temperatureController.text) < 28 ||
        double.parse(temperatureController.text) > 32 &&
            double.parse(temperatureController.text) <= 35) {
      return yellow;
    } else {
      return green;
    }
  }

  checkQualityColor() {
    if (quality.value == 'Poor') {
      return red;
    } else if (quality.value == 'Medium') {
      return yellow;
    } else {
      return green;
    }
  }
}
