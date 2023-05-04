import 'package:flutter/material.dart';
import 'package:weather_flutter/routers/routers.dart';
import 'package:get/get.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routers.searchPage), // 点击跳转城市搜索页面
      child: Container(
        width: double.infinity,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFf5f5f5),
        ),
        child: Row(
          children: <Widget>[
            Container(
              // 搜索图标
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const Icon(
                Icons.search,
                color: Color(0xff878787),
              ),
            ),
            // 搜索框提示
            const Text("城市搜索", style: TextStyle(color: Color(0xff878787))),
          ],
        ),
      ),
    );
  }
}
