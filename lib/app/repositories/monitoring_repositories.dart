import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/constants.dart';
import '../constants/endpoints.dart';
import '../services/dio_client.dart';
import '../shared/utils/app_snackbar.dart';

class MonitoringRepositories {
  DioClient dioClient = DioClient(API_BASE_URL);

  Future<Response?> getMonitoring() async {
    try {
      final res = await dioClient.create().get(Endpoints.getMonitoring);

      log('Response: ${res.statusCode}');

      if (res.statusCode == 200) {
        // log('Response: ${res.data}');
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
