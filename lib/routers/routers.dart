import 'package:weather_flutter/pages/cities.dart';
import 'package:weather_flutter/pages/home.dart';
import 'package:weather_flutter/pages/aqi.dart';
import 'package:weather_flutter/pages/search_city.dart';
import 'package:get/get.dart';

class Routers {
  static const String homePage = "/";
  static const String cityPage = "/cities";
  static const String searchPage = "/search-city";
  static const String settingPage = "/";
  static const String aqiPage = "/AQI";

  static List<GetPage> getPage() {
    return [
      GetPage(
          name: homePage,
          page: () => const HomePage(), // 首页
        ),
        GetPage(
          name: cityPage,
          page: () => const CityPage(), // 城市管理
        ),
        GetPage(
          name: searchPage,
          page: () => const SearchPage(), // 城市搜索
        ),
        GetPage(
          name: aqiPage,
          page: () => const AQIPage(), // 城市搜索
        )
    ];
  }
}
