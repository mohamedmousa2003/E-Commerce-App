import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences sharedPreference;

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  // save data

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is int) {
      return sharedPreference.setInt(key, value);
    } else if (value is double) {
      return sharedPreference.setDouble(key, value);
    } else if (value is String) {
      return sharedPreference.setString(key, value);
    } else if (value is bool) {
      return sharedPreference.setBool(key, value);
    } else {
      return sharedPreference.setStringList(key, value);
    }
  }

  // get data
  static Object? getData({required String key}) {
    return sharedPreference.get(key);
  }

  // remove Data
  static Future<bool> removeData({required String key}) async {
    return await sharedPreference.remove(key);
  }
}
