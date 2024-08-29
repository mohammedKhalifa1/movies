import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/home_page_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool active = false;
    Get.put(HomePageBottpm());
    return GetBuilder<HomePageBottpm>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(controller.widget.length, (index) {
                    controller.active = controller.count == index
                        ? controller.active = true
                        : controller.active = false;
                    return InkWell(
                      onTap: () {
                        controller.changeCount(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Icon(
                              controller.title[index]['icon'],
                              color: controller.active == true
                                  ? Color(0xfff30000)
                                  : Color(0xff2d2d2c),
                            ),
                            Text(
                              controller.title[index]['title'],
                              style: TextStyle(
                                  color: controller.active == true
                                      ? const Color(0xfff30000)
                                      : const Color(0xff2d2d2c),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          body: controller.widget.elementAt(controller.count),
        );
      },
    );
  }
}
