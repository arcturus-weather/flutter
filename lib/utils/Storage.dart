// ignore_for_file: file_names, avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? prefs;

  Future<void> init() async {
    prefs ??= await SharedPreferences.getInstance();
    print("prefs获取成功");
  }

  // 存储 bool 值
  void setBoolItem(String key, bool value) {
    prefs?.setBool(key, value);
  }

  // 存储 double 值
  void setDoubleItem(String key, double value) {
    prefs?.setDouble(key, value);
  }

  // 存储 int 值
  void setIntItem(String key, int value) {
    prefs?.setInt(key, value);
  }

  // 存储 String 值
  void setStringItem(String key, String value) {
    prefs?.setString(key, value);
  }

  // 存储 StringList
  void setStringListItem(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  // 获取 bool 内容
  bool? getBoolItem(String key) {
    bool? value = prefs?.getBool(key);
    return value;
  }

  // 获取 double 内容
  double? getDoubleItem(String key) {
    double? value = prefs?.getDouble(key);
    return value;
  }

  // 获取 int 内容
  int? getIntItem(String key) {
    int? value = prefs?.getInt(key);
    return value;
  }

  // 获取 String 内容
  String? getStringItem(String key) {
    String? value = prefs?.getString(key);
    return value;
  }

  // 获取 StringList 内容
  List<String>? getStringListItem(String key) {
    List<String>? value = prefs?.getStringList(key);
    return value;
  }

  // 根据 key 获取内容
  getItem(String key) {
    var value = prefs?.get(key);
    return value;
  }

  // 移除
  void remove(String key) {
    prefs?.remove(key);
  }

  // 清空
  void clear() {
    prefs?.clear();
  }

  // 获取所有的 key
  List<String>? keys() {
    List<String>? keyList = prefs?.getKeys().toList();
    return keyList;
  }

  // 判断是否存在 key
  bool? hasKey(String value) {
    return prefs?.containsKey(value);
  }
}
