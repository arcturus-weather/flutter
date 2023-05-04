import 'package:weather_flutter/components/cities_list.dart';
import 'package:weather_flutter/components/search_textfield.dart';
import 'package:weather_flutter/components/search_cities_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/store/weather_controller.dart';

// 城市搜索
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Controller c = Get.find<Controller>();

  // 按钮样式
  ButtonStyle style = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(const Color(0xfff5f5f5)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, // 无阴影(高度)
        backgroundColor: Colors.transparent, // 透明背景
        automaticallyImplyLeading: false,
        title: const SearchTextField(), // 搜索框
        actions: [
          TextButton(
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory, // 去掉水波纹
            ),
            onPressed: () => Get.back(),
            child: const Text("取消"),
          )
        ],
      ),
      body: GetBuilder<Controller>(
        init: c,
        builder: (_) => Column(
          children: [
            if (_.disPlayCittList)
              Expanded(child: CitiesList())
            else
              Expanded(child: SearchCityList())
          ],
        ),
      ),
    );
  }
}
