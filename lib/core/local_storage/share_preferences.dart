// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;
  static const String LOGIN_KEY = "#55123SWE1784423";
  SharedPref(){
    init();
  }

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool({required String key,required bool value}) async {
    return prefs.setBool(key, value);
  }

  static bool getBool({required String key}) {
    return prefs.getBool(key) ?? false;}


}

