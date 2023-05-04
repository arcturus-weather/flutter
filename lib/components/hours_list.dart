// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_flutter/components/hour.dart';

// 模拟数据
// import 'package:weather_flutter/mock/hours.dart';

class HourList extends StatelessWidget {
  const HourList({Key? key, this.hourly}) : super(key: key);

  final List? hourly;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: hourly != null,
      child: Card(
        elevation: 0.5,
        margin: const EdgeInsets.all(10),
        child: Container(
          height: 230,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: const Text(
                  "小时概况",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // 遍历逐小时天气
                    ...?hourly?.map((e) {
                      return OneHour(
                        iconCode: e.icon,
                        date: e.fxTime,
                        temp: e.temp,
                        windScale: e.windScaley,
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
