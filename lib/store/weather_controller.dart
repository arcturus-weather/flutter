// ignore_for_file: avoid_print, unused_field, non_constant_identifier_names

import 'package:flutter_qweather/flutter_qweather.dart';
import 'package:flutter_qweather/constants.dart';
import 'package:weather_flutter/utils/Storage.dart';
import 'package:weather_flutter/routers/routers.dart';
import 'package:weather_flutter/utils/init.dart';
import 'package:get/get.dart';

// 模拟数据
import 'package:weather_flutter/mock/air.dart';

// 天气控制器
class Controller extends GetxController {
  String? location;
  String? loc_name;
  String? temperature;
  String? feel;
  String? weather;
  String? airquality = air["now"]["category"];
  String? aqi = air["now"]["aqi"];
  String? humidity;
  String? pressure;
  String? vis;
  String? cloud;
  List? daily;
  List? hourly;

  bool disPlayCittList = true; // 是否展示城市列表
  List cities = [];

  LocalStorage? ls;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("控制器相关属性初始化...");
    ls = LocalStorage(); // 创建缓存实例
    await ls!.init();
    getProp();
    initQweather(); // 和风天气初始化
  }

  void getProp() {
    // 获取坐标
    location = ls?.getStringItem("locations");
    print("获取本地存储的位置信息:$location");

    // 获取坐标名
    loc_name = ls?.getStringItem("loc_name");
    print("获取本地存储的位置名:$loc_name");

    update();
  }

  void getWeather() async {
    // 实时天气
    WeatherNowResp? e = await FlutterQweather.instance.getWeatherNow(location!);

    temperature = e?.now.temp;
    feel = e?.now.feelsLike;
    weather = e?.now.text;
    humidity = e?.now.humidity;
    pressure = e?.now.pressure;
    vis = e?.now.vis;
    cloud = e?.now.cloud;

    print("温度:$temperature\n体感:$feel\n天气:$weather\n湿度:$humidity");

    // 逐天
    WeatherDailyResp? d = await FlutterQweather.instance
        .getWeatherDaily(location!, WeatherDailyForecast.WeatherForecast15Day);
    print("每日天气:\n$d");
    daily = d?.daily;

    // 逐小时
    WeatherHourlyResp? h = await FlutterQweather.instance.getWeatherHourly(
        location!, WeatherHourlyForecast.WeatherForecast24Hour);
    print("逐小时天气:\n$h");
    hourly = h?.hourly;

    update();
  }

  void getLoc(String value) async {
    // 获取位置坐标
    GeoPoiLocationResp? g = await FlutterQweather.instance.geoCityLookup(value);
    if (g != null) {
      List locList = g.locations;

      print("位置信息:\n${locList[0]}");

      location = "${locList[0].lon},${locList[0].lat}";
      loc_name = value;
      ls?.setStringItem("locations", location!);
      ls?.setStringItem("loc_name", value);

      print("坐标信息:\n$location");

      update();
      Get.offAllNamed(Routers.homePage); // 跳转主页
    }
  }

  void nav(String loc, String name) {
    // 跳转
    ls?.setStringItem("locations", loc);
    ls?.setStringItem("loc_name", name);
    loc_name = name;
    location = loc;
    disPlayCittList = true;
    update();
    Get.offAllNamed(Routers.homePage); // 跳转主页
  }

  void getCitiesList(String value) async {
    GeoPoiLocationResp? c = await FlutterQweather.instance.geoCityLookup(value);

    if (c != null) {
      disPlayCittList = false; // 取消展示页面
      print("城市列表是否展示?:$disPlayCittList");
      cities = c.locations; // 城市信息
      for (int i = 0; i < cities.length; i++) {
        var c = cities[i];
        print("${c.name}-${c.adm2}-${c.adm1}-${c.country}");
      }
      update();
    }
  }

  void cancelSearchcity() {
    disPlayCittList = true;
    update();
  }
}
