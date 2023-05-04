import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/store/weather_controller.dart';
// import 'package:weather_flutter/utils/Storage.dart';
import 'package:weather_flutter/components/search_button.dart';
import 'package:weather_flutter/components/weather_panel.dart';

// 城市管理
class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => CityPageState();
}

class CityPageState extends State<CityPage> {
  Controller c = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 白色背景
      appBar: AppBar(
        elevation: 0, // 无阴影(高度)
        backgroundColor: Colors.transparent, // 透明背景
        iconTheme: const IconThemeData(color: Colors.black), // 黑色图标
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('城市管理', style: TextStyle(fontSize: 30)),
            const SearchButton(), // 搜索框
            WeatherPanel(isLocate: true,location: c.loc_name,airCondition: "28",maxTemperature: c.temperature),
          ],
        ),
      ),
    );
  }
}
