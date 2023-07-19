import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static final String token = "TOKEN";
  static final String cookie = "COOKIE";
  static final String login = "LOGIN";
  static final String senha = "SENHA";
}

class StorageHelper {
  static Future<String?> get(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }

  static void set(String key, dynamic value) async {
    (await SharedPreferences.getInstance()).setString(key, value);
  }

  static void remove(String key) async {
    (await SharedPreferences.getInstance()).remove(key);
  }
}
