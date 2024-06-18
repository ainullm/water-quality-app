import 'dart:developer';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/constants/constants.dart';
import 'package:spk_water_quality_fuzzyahp_ta/app/constants/endpoints.dart';

import '../services/dio_client.dart';
import '../shared/utils/app_snackbar.dart';

class WaterQualityRepositories {
  DioClient dioClient = DioClient(API_BASE_URL);
  String BASE_URL = "http://10.0.2.2:5000/calculate";

  Future<Response?> waterQualityCheck() async {
    try {
      var dataWater = <String, dynamic>{
        'do': 3.0,
        'ph': 7.0,
        'salinitas': 15.0,
        'suhu': 30.0,
      };
      final res = await dioClient.create().post(BASE_URL, data: dataWater);

      log('Response: ${res.statusCode}');

      if (res.statusCode == 200) {
        // ProfileController.to.getProfile();
        // AppSnackbar.success(title: 'Sukses!', subtitle: 'Berhasil!');

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
