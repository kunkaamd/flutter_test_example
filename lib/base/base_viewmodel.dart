import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:test_round_1/components/loading_dialog.dart';
import 'package:test_round_1/network/api_service.dart';
import 'package:test_round_1/utils/shared_prefs.dart';

import '../components/message_popup.dart';

class BaseViewModel extends GetxController {
  late final pref = Get.find<SharedPrefs>();
  late final api = Get.find<ApiService>();

  showLoading() {
    Get.dialog(const LoadingDialog());
  }

  showMessage(String message) {
    Get.dialog(MessageDialog(message: message,));
  }

  hideLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }

  showError(String error) {
    Get.dialog(MessageDialog(message: error,));
  }
}