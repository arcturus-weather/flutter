// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_flutter/utils/unicode.dart';
import 'package:weather_flutter/utils/week.dart';

class OneDay extends StatefulWidget {
  final String iconDay; // 白天天气图标代码
  final String iconNight; // 夜间天气图标代码
  final String date; // 时间
  final String tempMax; // 最高温度
  final String tempMin; // 最低温度

  const OneDay({
    Key? key,
    required this.iconDay,
    required this.iconNight,
    required this.date,
    required this.tempMax,
    required this.tempMin,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => DayState();
}

class DayState extends State<OneDay> {
  @override
  Widget build(BuildContext context) {
    DateTime d = DateTime.parse(widget.date).toLocal();
    String date = "${d.month}-${d.day}";
    String week = "${d.weekday}";

    return InkWell(
      onTap: () {
        print("点击了$date");
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(tweek[week]), // 星期
            ),
            Text(date), // 时间
            Container(
              // 温度
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "${widget.tempMax}°",
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
                  int.parse(iconCodeForLight[widget.iconDay]),
                  fontFamily: 'qweather',
                ),
                size: 30,
              ),
            ),
            Container(
              // 天气图标
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Icon(
                IconData(
                  int.parse(iconCodeForLight[widget.iconNight]),
                  fontFamily: 'qweather',
                ),
                size: 30,
              ),
            ),
            Container(
              // 温度
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                "${widget.tempMin}°",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
