// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// 天气小组件
class WeatherPanel extends StatefulWidget {
  const WeatherPanel({
    Key? key,
    this.isLocate,
    this.minTemperature,
    this.maxTemperature,
    this.location,
    this.airCondition,
  }) : super(key: key);

  final bool? isLocate; // 是否是当前位置
  final String? minTemperature;
  final String? maxTemperature;
  final String? location;
  final String? airCondition;

  @override
  State<StatefulWidget> createState() => WeatherPanelState();
}

class WeatherPanelState extends State<WeatherPanel> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.location != null,
      child: Ink(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue[400],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => print("点击"),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.location??"N/A", // 当前位置
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.isLocate??false)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Icon(
                              Icons.room,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.airCondition??"N/A", // 空气质量
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                        // Container(
                        //   margin: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: Text(
                        //     "${widget.maxTemperature??'N/A'}°/${widget.minTemperature??'N/A'}°",
                        //     style: const TextStyle(
                        //         fontSize: 15, color: Colors.white),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
                Text(
                  // 温度
                  "${widget.maxTemperature??'N/A'}°",
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
