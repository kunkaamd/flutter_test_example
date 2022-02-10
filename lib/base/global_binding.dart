import 'package:get/get.dart';
import 'package:test_round_1/network/api_service.dart';
import 'package:test_round_1/utils/shared_prefs.dart';

class GlobalBinding {
  static Future<void> setupInjector() async {
    await Get.putAsync<SharedPrefs>(() async {
      final _pref = SharedPrefs();
      await _pref.initialise();
      return _pref;
    });

    await Get.putAsync<ApiService>(() async{
      return ApiService();
    },);
  }
}

