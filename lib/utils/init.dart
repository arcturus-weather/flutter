import 'package:flutter_qweather/flutter_qweather.dart';

// 初始化 Qweather
Future<void> initQweather() async {
  QweatherConfig config = QweatherConfig(
      publicIdForAndroid: 'HE2112182010221800',
      keyForAndroid: '5230fc5552834b719b2aabfe8f427cc6',
      biz: false,
      debug: true);
  await FlutterQweather.instance.init(config);
}
