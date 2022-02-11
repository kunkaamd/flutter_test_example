import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_round_1/base/base_viewmodel.dart';
import 'package:test_round_1/constants/constants.dart';
import 'package:test_round_1/network/dto/user_request_dto.dart';
import 'package:dio/dio.dart';

class SignUpVM extends BaseViewModel {
  final txtEmail = TextEditingController(text: "");
  final txtPwd = TextEditingController(text: "");

  signUp() async {
    if (!txtEmail.text.isEmail ||
        txtPwd.text.strongPassword() == PasswordStrong.tooShort) return;
    try {
      showLoading();
      String deviceId = "";
      String osVersion = "";
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) { // import 'dart:io'
        var iosDeviceInfo = await deviceInfo.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor ?? "";
        osVersion = iosDeviceInfo.systemVersion ?? "";
      } else {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        deviceId = androidDeviceInfo.androidId ?? "";
        osVersion = androidDeviceInfo.version.release ?? "";
      }
      final userRequestDTO = UserRequestDTO(
        osVersion: osVersion,
        email: txtEmail.text,
        password: txtPwd.text,
        appVersion: "6.2.59.100",
        deviceId: deviceId,
      );
      final response = await api.common.signUp(userRequestDTO);
      pref.accessToken = response.accessToken;
      pref.userId = response.id;
      Get.toNamed("/categories");
    } on DioError catch (_) {
      hideLoading();
      showError(_.getErrorMessage());
    } catch (_) {
      hideLoading();
      showError(_.toString());
    }
  }
}
