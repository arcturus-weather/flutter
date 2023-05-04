import 'package:flutter/material.dart';

class Pollution extends StatefulWidget {
  const Pollution({Key? key, required this.now}) : super(key: key);

  final Map now;

  @override
  State<StatefulWidget> createState() => PollutionState();
}

class PollutionState extends State<Pollution> {
  List<String> pollution = ["pm2p5", "pm10", "no2", "so2", "o3", "co"];
  List<String> unit = ["μg/m³", "μg/m³", "μg/m³", "μg/m³", "μg/m³", "mg/m³"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: const Text(
              "污染物",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
              ),
              // 污染物
              children: pollution.asMap().entries.map(
                (entry) {
                  int index = entry.key;
                  String v = entry.value;
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white, // 污染物方块背景色
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text("$v ${unit[index]}"),
                        ),
                        Text(
                          widget.now[v],
                          style: const TextStyle(fontSize: 35),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
