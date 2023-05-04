// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_flutter/store/weather_controller.dart';
import 'package:get/get.dart';

// 城市搜索输入框
class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  // 定义一个 controller
  TextEditingController controller = TextEditingController();

  final Controller c = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: BoxConstraints(),
          hintText: '输入城市名称',
          border: OutlineInputBorder(borderSide: BorderSide.none), // 去掉底部横线
        ),
        onSubmitted: (String value) {
          // 回车事件
          print("输入$value");
          c.getCitiesList(value);
        },
        onChanged: (String value) {
          // 输入改变事件
          print("输入改变成$value了");
          if (value == "") {
            print("展示默认城市");
            c.cancelSearchcity(); // 为空时取消城市搜索列表展示
          }
        },
      ),
    );
  }
}
