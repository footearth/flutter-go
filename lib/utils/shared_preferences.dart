import 'dart:async';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

export '../resources/shared_preferences_keys.dart';

/// 用来做shared_preferences的存储
class SpUtil {

  static SpUtil _instance
  ;
  static Future<SpUtil> get instance async =>
    await getInstance()
  ;

  static SharedPreferences _spf
  ;

  SpUtil._()
  ;

  Future _init() async {
    _spf = await
      SharedPreferences
      .getInstance()
    ;
  }

  static Future<SpUtil> getInstance() async {

    if (_instance == null) {
      _instance = new SpUtil._()
      ;
      await _instance._init()
      ;
    }
    return _instance
    ;
  }

  static bool _beforeCheck() =>
    _spf == null
    ? true
    : false
  ;

  // 判断是否存在数据
  bool hasKey(String key) {
    Set keys = getKeys()
    ;
    return keys.contains(key)
    ;
  }

  Set<String> getKeys() =>
    _beforeCheck()
    ? null
    : _spf.getKeys()
  ;

  get(String key) =>
    _beforeCheck()
    ? null
    : _spf.get(key)
  ;

  getString(String key) =>
    _beforeCheck()
    ? null
    : _spf.getString(key)
  ;

  Future<bool> putString(
    String key
  , String value
  ) =>
    _beforeCheck()
    ? null
    : _spf.setString(key, value)
  ;

  bool getBool(
    String key
  ) =>
    _beforeCheck()
    ? null
    : _spf.getBool(key)
  ;

  Future<bool> putBool(
    String key
  , bool value
  ) =>
    _beforeCheck()
    ? null
    : _spf.setBool(key, value)
  ;

  int getInt(
    String key
  ) =>
    _beforeCheck()
    ? null
    : _spf.getInt(key)
  ;

  Future<bool> putInt(
    String key
  , int value
  ) =>
    _beforeCheck()
    ? null
    : _spf.setInt(key, value)
  ;

  double getDouble(
    String key
  ) =>
    _beforeCheck()
    ? null
    : _spf.getDouble(key)
  ;

  Future<bool> putDouble(
    String key
  , double value
  ) =>
    _beforeCheck()
    ? null
    : _spf.setDouble(key, value)
  ;

  List<String> getStringList(
    String key
  ) =>
    _beforeCheck()
    ? null
    : _spf.getStringList(key)
  ;

  Future<bool> putStringList(
    String key
  , List<String> value
  ) =>
    _beforeCheck()
    ? null
    : _spf.setStringList(key, value)
  ;

  dynamic getDynamic(
    String key
  ) =>
    _beforeCheck()
    ? null
    : _spf.get(key)
  ;

  Future<bool> remove(
    String key
  ) =>
    _beforeCheck()
    ? null
    : _spf.remove( key )
  ;

  Future<bool> clear() =>
    _beforeCheck()
    ? null
    : _spf.clear()
  ;

}
