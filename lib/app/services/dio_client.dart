import 'dart:io';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as dev;

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../constants/custom_dio.dart';

class DioClient {
  DioClient(this._baseUrl);

  final String _baseUrl;

  Dio create() {
    return CustomDio(_baseUrl).create()
      ..interceptors.addAll([ApiInterceptor()]);
  }
}

class ApiInterceptor extends Interceptor {
  final int retries = 1;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final packageInfo = await PackageInfo.fromPlatform();

    String? platform;
    if (Platform.isAndroid) {
      platform = 'android';
    } else if (Platform.isIOS) {
      platform = 'ios';
    }

    options.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-client-id': packageInfo.packageName,
      'x-client-version': packageInfo.version,
    });

    if (platform != null) {
      options.headers.putIfAbsent('x-client-platform', () => platform);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString(KEY_ACCESS_TOKEN);
    if (accessToken != null) {
      options.headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $accessToken');
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }
    final attempt = err.requestOptions._retryAttempt + 1;
    if (attempt > retries) return super.onError(err, handler);

    try {
      final dio = Dio(BaseOptions(baseUrl: API_BASE_URL));
      final prefs = await SharedPreferences.getInstance();
      var refreshToken = prefs.getString(KEY_REFRESH_TOKEN);
      if (refreshToken == null) return super.onError(err, handler);

      dio.options.headers['Authorization'] = 'Bearer $refreshToken';
      final response = await dio.get('/auth/refresh-token');

      if (response.statusCode == 200) {
        String accessToken = response.data['data'][KEY_ACCESS_TOKEN];
        String refreshToken = response.data['data'][KEY_REFRESH_TOKEN];
        await prefs.setString(KEY_ACCESS_TOKEN, accessToken);
        await prefs.setString(KEY_REFRESH_TOKEN, refreshToken);

        final options = err.requestOptions
          ..headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
        final newResponse = await dio.fetch(options);
        return handler.resolve(newResponse);
      }
    } on DioException catch (e) {
      dev.log(
          'ApiInterceptor, error refreshing token: ${e.response?.statusCode} ${e.response}');
    }

    super.onError(err, handler);
  }
}

extension AuthRequestOptionsX on RequestOptions {
  int get _retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;
  set _retryAttempt(int attempt) => extra['auth_retry_attempt'] = attempt;
}
