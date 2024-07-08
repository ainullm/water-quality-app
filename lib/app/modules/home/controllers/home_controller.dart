import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repositories/monitoring_repositories.dart';

class HomeController extends GetxController {
  RxDouble ph = 0.0.obs;
  RxDouble salinity = 0.0.obs;
  RxDouble temperature = 0.0.obs;
  RxDouble dissolvedOxygen = 0.0.obs;

  getMonitoringData() async {
    try {
      final resp = await MonitoringRepositories().getMonitoring();
      if (resp != null && resp.statusCode == 200) {
        dissolvedOxygen.value = resp.data['do'];
        ph.value = resp.data['ph'];
        salinity.value = resp.data['salinitas'];
        temperature.value = resp.data['suhu'];
      }
    } catch (e) {
      e.toString();
    }
  }
}
