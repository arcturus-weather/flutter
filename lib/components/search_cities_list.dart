import 'package:flutter/material.dart';
import 'package:weather_flutter/store/weather_controller.dart';
import 'package:get/get.dart';

class SearchCityList extends StatelessWidget {
  final Controller c = Get.find<Controller>();

  SearchCityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          ...c.cities.map((e) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    c.nav("${e.lon},${e.lat}", e.name);
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "${e.name}-${e.adm2}-${e.adm1}-${e.country}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Divider()
              ],
            );
          })
        ],
      ),
    );
  }
}
