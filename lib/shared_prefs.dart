import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPreferences;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  void setUpdateDateTime(String updateDateTime) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString("UpdateDateTime", updateDateTime);
  }

  void setNotificationFlag(String notificationFlag) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString("NotificationFlag", notificationFlag);
  }

  void setFontSize(String fontSize) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString("FontSize", fontSize);
  }

  Future<String> getUpdateDateTime() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String? dt = "0";
    try {
      dt = _sharedPreferences?.getString("UpdateDateTime");
    } catch (e) {
      if (dt == null) dt = "0";
    }
    return dt == null ? "0" : dt;
  }

  Future<String> getFontSize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String? fs = "20";
    try {
      fs = _sharedPreferences?.getString("FontSize");
    } catch (e) {
      if (fs == null) fs = "20";
    }
    return fs == null ? "20" : fs;
  }

  Future<String> getNotificationFlag() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String? flag = "true";
    try {
      flag = _sharedPreferences?.getString("NotificationFlag");
    } catch (e) {
      if (flag == null) flag = "false";
    }
    return flag == null ? "false" : flag;
  }

  Future<String> lang() async {
    String? lang;
    lang = _sharedPreferences?.getString("SelectedLanguageCode");
    return lang == null ? "de" : lang;
  }
}
