import 'dart:developer';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/constants/constants.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/constants/endpoints.dart';

import '../services/dio_client.dart';
import '../shared/utils/app_snackbar.dart';

class WaterQualityRepositories {
  DioClient dioClient = DioClient(API_BASE_URL);

  Future<Response?> waterQualityCheck(Map<String, dynamic> data) async {
    try {
      var dataWater = <String, dynamic>{
        'do': data['do'],
        'ph': data['ph'],
        'suhu': data['suhu'],
        'salinitas': data['salinitas'],
      };
      final res = await dioClient
          .create()
          .post(Endpoints.waterQualityCheck, data: dataWater);

      log('Response: ${res.statusCode}');

      if (res.statusCode == 200) {
        log('Response: ${res.data}');
        return res;
      } else {
        AppSnackbar.failure(title: 'Gagal!', subtitle: res.data['message']);
      }
    } on DioException catch (e) {
      AppSnackbar.failure(
          title: 'Gagal!',
          subtitle: e.response?.statusMessage ?? 'Ada masalah');
      return e.response;
    }
    return null;
  }

  Future<Response?> getThresholds() async {
    try {
      final res = await dioClient.create().get(Endpoints.getThresholds);

      log('Response: ${res.statusCode}');

      if (res.statusCode == 200) {
        log('Response: ${res.data}');
        return res;
      } else {
        AppSnackbar.failure(title: 'Gagal!', subtitle: res.data['message']);
      }
    } on DioException catch (e) {
      AppSnackbar.failure(
          title: 'Gagal!',
          subtitle: e.response?.statusMessage ?? 'Ada masalah');
      return e.response;
    }
    return null;
  }
}
