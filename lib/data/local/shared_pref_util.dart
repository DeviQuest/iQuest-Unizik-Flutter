import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future putStringInPref(String key, String value) async =>
      await _preferences.setString(key, value);

  static Future putIntInPref(String key, int value) async =>
      await _preferences.setInt(key, value);

  static Future putBooleanInPref(String key, bool value) async =>
      await _preferences.setBool(key, value);

  static String? getStringFromPref(String key) => _preferences.getString(key);

  static int? getIntFromPref(String key) => _preferences.getInt(key);

  static bool? getBoolFromPref(String key) => _preferences.getBool(key);
}