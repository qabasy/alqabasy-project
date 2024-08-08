import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static Future<void> setValue<T>(String key, T value,
      {bool evenExists = true}) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      prefs.setString(key, value.toString());
    }
  }

  static Future<void> initValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      if (value is int) {
        prefs.setInt(key, value);
      } else if (value is double) {
        prefs.setDouble(key, value);
      } else if (value is bool) {
        prefs.setBool(key, value);
      } else {
        prefs.setString(key, value.toString());
      }
    }
  }

  static Future<T?> getValue<T>(String key, {T? def}) async {
    final prefs = await SharedPreferences.getInstance();
    if (T == String) {
      return prefs.getString(key) as T? ?? def;
    } else if (T == int) {
      return prefs.getInt(key) as T? ?? def;
    } else if (T == double) {
      return prefs.getDouble(key) as T? ?? def;
    } else if (T == bool) {
      return prefs.getBool(key) as T? ?? def;
    }
    return def;
  }
}

void initSettings() async {
  // App.Info
  await AppSettings.initValue("App.Info.Name", "AL-Qabasy");
  await AppSettings.initValue("App.Info.Title", "AL-Qabasy");
  await AppSettings.initValue("App.Info.Version", "1.0.0");
  await AppSettings.initValue("App.Info.Author", "M&T");
  await AppSettings.initValue("App.Info.Description", "ECommerce Project");

  // App.Theme
  await AppSettings.initValue("App.Theme.Font.Family", "Cairo");
}
