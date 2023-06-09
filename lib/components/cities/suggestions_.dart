import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 城市建议列表
class CitiesList extends StatelessWidget {
  const CitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "热门城市",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 横轴子元素个数
                childAspectRatio: 2.5,
                mainAxisSpacing: 10, // 主轴间距
                crossAxisSpacing: 20, // 横轴间距
              ),
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // 定位按钮点击事件
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.room),
                      Text('定位'),
                    ],
                  ),
                ),
                // 建议列表
                ...suggestions().map((e) {
                  return ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                    child: Text(
                      e['name'],
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> suggestions() {
  return [
    {
      'name': '北京',
      'lat': 39.9,
      'lng': 116.41,
    },
    {
      'name': '上海',
      'lat': 31.23,
      'lng': 121.47,
    },
    {
      'name': '广州',
      'lat': 23.13,
      'lng': 113.28,
    },
    {
      'name': '深圳',
      'lat': 22.55,
      'lng': 114.09,
    },
    {
      'name': '珠海',
      'lat': 22.26,
      'lng': 113.54,
    },
    {
      'name': '佛山',
      'lat': 23.0,
      'lng': 113.12,
    },
    {
      'name': '南京',
      'lat': 32.05,
      'lng': 118.79,
    },
    {
      'name': '苏州',
      'lat': 31.3,
      'lng': 120.57,
    },
    {
      'name': '厦门',
      'lat': 24.45,
      'lng': 118.08,
    },
    {
      'name': '昆明',
      'lat': 25.04,
      'lng': 102.71,
    },
    {
      'name': '成都',
      'lat': 30.66,
      'lng': 104.07,
    },
    {
      'name': '长沙',
      'lat': 28.19,
      'lng': 112.98,
    },
    {
      'name': '福州',
      'lat': 26.08,
      'lng': 119.31,
    },
    {
      'name': '武汉',
      'lat': 30.58,
      'lng': 114.3,
    },
    {
      'name': '杭州',
      'lat': 30.29,
      'lng': 120.15,
    },
    {
      'name': '南宁',
      'lat': 22.82,
      'lng': 108.32,
    },
    {
      'name': '西安',
      'lat': 34.26,
      'lng': 108.95,
    },
    {
      'name': '青岛',
      'lat': 36.09,
      'lng': 120.37,
    },
    {
      'name': '海口',
      'lat': 20.03,
      'lng': 110.33,
    },
    {
      'name': '天津',
      'lat': 39.13,
      'lng': 117.19,
    },
  ];
}
