import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_round_1/constants/constants.dart';
import 'package:test_round_1/utils/shared_prefs.dart';

import 'common_service.dart';

class ApiService {
  final dio = Dio();
  late CommonService common;

  ApiService() {
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          responseBody: true, requestBody: true, request: true));
    }

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = Get.find<SharedPrefs>().accessToken;

      if (token?.isNotEmpty ?? false) {
        options.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
      }

      // if (options.data != null && options.data is FormData) {
      //   final FormData data = options.data as FormData;
      //   final files = data.files;
      //
      //   for (int i = 0; i < files.length; i++) {
      //     String? path = files[i].value.filename;
      //
      //     if (path == null) continue;
      //
      //     if (path.toLowerCase().contains('.heic')) {
      //       final pathJpg = await HeicToJpg.convert(path);
      //       final name = p.basename(pathJpg!);
      //       files[i] = MapEntry(
      //           files[i].key, MultipartFile.fromFileSync(path, filename: name));
      //     } else {
      //       final name = p.basename(path);
      //       files[i] = MapEntry(
      //           files[i].key, MultipartFile.fromFileSync(path, filename: name));
      //     }
      //   }
      // }
      handler.next(options);
    }, onError: (error, handler) async {
      handler.reject(error);
    }));

    common = CommonService(dio, baseUrl: Constant.baseApiUrl);
  }
}
