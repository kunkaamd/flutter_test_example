import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _prefs;

  Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? get accessToken => _prefs.getString('accessToken');

  set accessToken(String? accessToken) {
    if (accessToken != null) {
      _prefs.setString("accessToken", accessToken);
    }
  }

  int? get userId => _prefs.getInt("userId");

  set userId(int? userId) {
    if (userId != null) {
      _prefs.setInt("userId", userId);
    }
  }
}