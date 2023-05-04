import 'package:flutter/material.dart';
import 'package:weather_flutter/components/day.dart';

// 模拟数据
// import 'package:weather_flutter/mock/day.dart';

class DayList extends StatelessWidget {
  const DayList({Key? key, this.daily}) : super(key: key);

  final List? daily;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: daily != null,
      child: Card(
        elevation: 0.5,
        margin: const EdgeInsets.all(10),
        child: Container(
          height: 310,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: const Text(
                  "15天预报",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // 遍历逐小时天气
                    ...?daily?.map((e) {
                      return OneDay(
                        iconDay: e.iconDay,
                        iconNight: e.iconNight,
                        date: e.fxDate,
                        tempMax: e.tempMax,
                        tempMin: e.tempMin,
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
