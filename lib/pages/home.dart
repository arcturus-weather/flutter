// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:weather_flutter/routers/routers.dart';
import 'package:weather_flutter/components/main_weather.dart';
import 'package:weather_flutter/components/hours_list.dart';
import 'package:weather_flutter/components/days_list.dart';
import 'package:weather_flutter/components/details.dart';
import 'package:flutter/material.dart';
// import 'package:weather_flutter/pages/cities.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/store/weather_controller.dart';

// 模拟数据
import 'package:weather_flutter/mock/air.dart';
// import 'package:weather_flutter/mock/now.dart';
// import 'package:weather_flutter/mock/warning.dart';

// 首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // 模拟的数据...
  // final String temperature = now["now"]["temp"];
  // final String feel = now["now"]["feelsLike"];
  // final String weather = now["now"]["text"];
  // final String humidity = now["now"]["humidity"];
  // final String pressure = now["now"]["pressure"];
  // final String vis = now["now"]["vis"];
  // final String cloud = now["now"]["cloud"];
  // 暂不能使用插件获取的数据...
  final String airquality = air["now"]["category"];
  final String aqi = air["now"]["aqi"];

  final Controller c = Get.find<Controller>();

  @override
  void initState() {
    super.initState();
    print("主页初始化...");

    bool haveGet = false;

    if (c.location != null) {
      c.getWeather();
      haveGet = true;
    }

    Future.delayed(const Duration(seconds: 2), () {
      if (c.location == null) {
        print("跳转页面");
        Get.toNamed(Routers.cityPage);
      } else if (!haveGet) {
        c.getWeather();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: c,
      builder: (_) => home(),
    );
  }

  // c.getWeather();
  Widget home() {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true, // 滑到顶部后固定
            snap: false,
            floating: true,
            elevation: 0,
            expandedHeight: 300.0, // appbar 展开高度
            title: Text(
              c.loc_name ?? "N/A",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true, // 标题居中
            leading: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // 跳转城市页面
                Get.toNamed(Routers.cityPage);
              },
            ),
            actions: <Widget>[
              // 下拉弹框
              PopupMenuButton(
                onSelected: (value) {
                  if (value == "setting") {
                    print("设置");
                  } else if (value == "share") {
                    print("分享");
                  }
                },
                elevation: 1,
                offset: const Offset(0, 50),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: "share",
                    child: Text('分享'),
                  ),
                  const PopupMenuItem(
                    value: "setting",
                    child: Text("设置"),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: MainWeather(
                temperature: c.temperature ?? "N/A",
                feel: c.feel ?? "N/A",
                weather: c.weather ?? "N/A",
                airquality: c.airquality ?? "N/A",
                aqi: c.aqi ?? "N/A",
                waring: null,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              HourList(hourly: c.hourly),
              DayList(daily: c.daily),
              Detail(
                humidity: c.humidity,
                pressure: c.pressure,
                vis: c.vis,
                cloud: c.cloud,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
