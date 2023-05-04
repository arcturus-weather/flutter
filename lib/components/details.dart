import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String? humidity;
  final String? pressure;
  final String? vis;
  final String? cloud;

  const Detail({
    Key? key,
    this.pressure, // 大气压
    this.vis, // 能见度
    this.humidity, // 空气湿度
    this.cloud, // 云量
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> detail = ["空气湿度", "大气压力", "能见度", "云量"];
    List<String> unit = ["%", "hPa", "km", "%"];
    List value = [humidity, pressure, vis, cloud];
    List<IconData> icon = [
      Icons.water,
      Icons.speed,
      Icons.visibility,
      Icons.cloud
    ];

    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.all(10),
      child: Container(
        height: 225,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text(
                "详情",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                children: [
                  ...detail.asMap().entries.map((e) {
                    int i = e.key;
                    String v = e.value;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Icon(
                            icon[i],
                            size: 30,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Text(v),
                              ),
                              Text("${value[i]??'N/A'}${unit[i]}",
                                  style: const TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
