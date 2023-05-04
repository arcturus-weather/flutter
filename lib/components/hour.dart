// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_flutter/utils/unicode.dart';

class OneHour extends StatefulWidget {
  final String iconCode; // 天气图标代码
  final String date; // 时间
  final String temp; // 温度
  final String windScale; // 风级别
  final String? airQuality; // 空气质量

  const OneHour({
    Key? key,
    required this.iconCode,
    required this.date,
    required this.temp,
    required this.windScale,
    this.airQuality,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HourState();
}

class HourState extends State<OneHour> {
  @override
  Widget build(BuildContext context) {
    DateTime d = DateTime.parse(widget.date).toLocal();
    String date = "${d.hour}时";

    return InkWell(
      onTap: () {
        print("点击了第$date");
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(date), // 时间
            Container(
              // 温度
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "${widget.temp}°",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              // 天气图标
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Icon(
                IconData(
                  int.parse(iconCodeForLight[widget.iconCode]),
                  fontFamily: 'qweather',
                ),
                size: 30,
              ),
            ),
            // 风
            Column(children: [
              const Icon(Icons.near_me),
              Text("${widget.windScale}级"),
            ]),
            Visibility(
              // 空气质量
              visible: widget.airQuality != null,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff9dadc4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(widget.airQuality ?? ""),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
