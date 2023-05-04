// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:weather_flutter/routers/routers.dart';
import 'package:weather_flutter/store/weather_controller.dart';

// 城市建议列表
class CitiesList extends StatelessWidget {
  // 搜索建议
  final List<String> cities = [
    "北京市",
    "上海市",
    "广州市",
    "深圳市",
    "珠海市",
    "佛山市",
    "南京市",
    "苏州市",
    "厦门市",
    "南宁市",
    "昆明市",
    "成都市",
    "长沙市",
    "福州市",
    "杭州市",
    "武汉市",
    "青岛市",
    "西安市",
    "太原市",
    "石家庄市",
    "沈阳市",
    "重庆市",
    "天津市"
  ];

  // 按钮样式
  final ButtonStyle style = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(const Color(0xfff5f5f5)),
  );

  CitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text("热门城市"), // 热门城市标签
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 横轴 3 个元素
                childAspectRatio: 2, // 子元素长宽比 2.0
              ),
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      // 定位按钮点击事件
                      print("点击定位");
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text("定位"),
                        Icon(Icons.room),
                      ],
                    ),
                  ),
                ),
                ...cities.map((e) => Container(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          // 各种城市点击事件
                          print("点击$e");
                          // 获取地理位置坐标
                          Get.find<Controller>().getLoc(e);
                        },
                        style: style,
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
