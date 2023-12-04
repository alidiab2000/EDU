// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences  prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }
  static setData(String key, dynamic value) async {
    debugPrint('SharedPref: setData: $key, $value');
    switch (value.runtimeType) {
      case String:
        prefs.setString(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      case List:
        prefs.setStringList(key, value);
        break;
      default:
        debugPrint('SharedPref: setData: $key, $value: type not found');
    }
  }
  static Future<void> removeData(String key) async {
    debugPrint('SharedPref: removeData: $key');
    prefs.remove(key);
  }
  static  getData(String key) async {
    switch (prefs.get(key).runtimeType) {
      case String:
        return prefs.getString(key) ?? "";
      case int:
        return prefs.getInt(key) ?? 0;
      case double:
        return prefs.getDouble(key) ?? 0.0;
      case bool:
        return prefs.getBool(key) ?? false;
      case List:
        return prefs.getStringList(key) ?? [];
      default:
        debugPrint('SharedPref: getData: $key: type not found');
        return null;
    }
  }
}
