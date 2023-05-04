import 'package:weather_flutter/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWeather extends StatefulWidget {
  const MainWeather(
      {Key? key,
      required this.temperature,
      required this.feel,
      required this.weather,
      required this.airquality,
      required this.aqi,
      this.waring})
      : super(key: key);

  final String temperature; // 温度
  final String feel; // 体感温度
  final String weather; // 天气状况
  final String airquality; // 空气质量
  final String aqi; // 空气质量指数
  final String? waring; // 预警信息

  @override
  State<StatefulWidget> createState() => MainWeatherState();
}

class MainWeatherState extends State<MainWeather> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // Image.asset(
        //   "assets/images/bg.png",
        //   fit: BoxFit.cover,
        // ),
        Positioned(
          bottom: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.temperature}℃",
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              Text(
                "${widget.weather}, 体感${widget.feel}℃",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Wrap(
                spacing: 8, // 主轴(水平)方向间距
                runSpacing: 4, // 纵轴(垂直)方向间距
                // 沿主轴方向居中
                alignment: WrapAlignment.center,
                children: <Widget>[
                  OutlinedButton.icon(
                    icon: const Icon(Icons.spa, color: Colors.white),
                    label: Text(
                      "${widget.airquality} ${widget.aqi}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Get.toNamed(Routers.aqiPage);
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                    ),
                  ),
                  if (widget.waring != null)
                    OutlinedButton.icon(
                      icon: const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                      ),
                      label: Text(
                        "${widget.waring}预警",
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
