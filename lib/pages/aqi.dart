import 'package:flutter/material.dart';
import 'package:weather_flutter/components/air/pollution.dart';

// 模拟数据
import 'package:weather_flutter/mock/air.dart';

class AQIPage extends StatefulWidget {
  const AQIPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AQIState();
}

class AQIState extends State<AQIPage> {
  String aqi = air["now"]["aqi"];
  double per = int.parse(air["now"]["aqi"]) / 300;
  String airquality = air["now"]["category"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "空气质量",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(30),
                // 环形进度条
                child: CircularProgressIndicator(
                  backgroundColor: const Color(0xFFf5f5f5),
                  strokeWidth: 10,
                  value: per,
                ),
              ),
              Column(
                children: [
                  Text(
                    aqi.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(airquality),
                ],
              ),
            ],
          ),
          Expanded(
            child: Pollution(now: air["now"]),
          ),
        ],
      ),
    );
  }
}
