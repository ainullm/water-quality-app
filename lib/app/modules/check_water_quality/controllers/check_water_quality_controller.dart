import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../repositories/water_quality_repositories.dart';
import '../../../shared/styles/app_colors.dart';

class CheckWaterQualityController extends GetxController {
  var quality = ''.obs;
  var weights = [].obs;
  var wsmValue = 0.0.obs;
  var ph = 0.0.obs;
  var salinity = 0.0.obs;
  var temperature = 0.0.obs;
  var dissolvedOxygen = 0.0.obs;
  ScrollController scrollController = ScrollController();

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  Future<void> checkWater() async {
    try {
      final resp = await WaterQualityRepositories().waterQualityCheck();
      if (resp != null && resp.statusCode == 200) {
        quality.value = resp.data['quality'];
        weights.value = List<double>.from(resp.data['weights']);
        wsmValue.value = resp.data['wsm'];
        ph.value = resp.data['ph'];
        salinity.value = resp.data['salinitas'];
        temperature.value = resp.data['suhu'];
        dissolvedOxygen.value = resp.data['do'];
      } else {
        resetParameters();
      }
    } catch (e) {
      log('Error: $e');
      // Reset all parameters in case of error
      resetParameters();
    }
    log('Quality: ${quality.value}');
    log('Weights: $weights');
    log('WSM Value: ${wsmValue.value}');
    log('pH: ${ph.value}');
    log('Salinity: ${salinity.value}');
    log('Temperature: ${temperature.value}');
    log('Dissolved Oxygen: ${dissolvedOxygen.value}');
  }

  void resetParameters() {
    quality.value = '';
    weights.clear();
    wsmValue.value = 0.0;
    ph.value = 0.0;
    salinity.value = 0.0;
    temperature.value = 0.0;
    dissolvedOxygen.value = 0.0;
  }

  checkDoColor() {
    if (dissolvedOxygen.value < 5 || dissolvedOxygen.value > 8) {
      return red;
    } else if (dissolvedOxygen.value >= 5 && dissolvedOxygen.value <= 6) {
      return yellow;
    } else {
      return green;
    }
  }

  checkPhColor() {
    if (ph.value < 6.5 || ph.value > 9.5) {
      return red;
    } else if (ph.value > 6.5 && ph.value < 7.5 ||
        ph.value > 8.5 && ph.value < 9.5) {
      return yellow;
    } else {
      return green;
    }
  }

  checkSalinityColor() {
    if (salinity.value < 0 || salinity.value > 35) {
      return red;
    } else if (salinity.value >= 0 && salinity.value < 15 ||
        salinity.value > 30 && salinity.value <= 35) {
      return yellow;
    } else {
      return green;
    }
  }

  checkTemperatureColor() {
    if (temperature.value < 26 || temperature.value > 35) {
      return red;
    } else if (temperature.value >= 26 && temperature.value < 28 ||
        temperature.value > 32 && temperature.value <= 35) {
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
