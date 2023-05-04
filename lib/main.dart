// ignore_for_file: avoid_print

import 'package:weather_flutter/routers/routers.dart';
import 'package:weather_flutter/store/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetMaterialApp(
      title: 'weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/", // 默认路由
      getPages: Routers.getPage(),
    );
  }
}
