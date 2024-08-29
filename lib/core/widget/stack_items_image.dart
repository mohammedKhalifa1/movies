import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/widget/text.dart';

import '../../controller/items_controller.dart';
import '../../controller/items_like_thes_controller.dart';
import '../class/app_route.dart';

class StackImageItems extends StatelessWidget {
  const StackImageItems({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ItemsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: Get.height / 2.5,
          child: Image.network(
            controller.movieModel.poster!,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: double.infinity,
          height: Get.height / 2.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, Color(0xff1d1d1d)],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextApp(title: controller.movieModel.title!, siza: 20),
                const Text(
                  "  Available now",
                  style: TextStyle(
                      color: Color(0xfff30000), fontWeight: FontWeight.bold),
                )
              ],
            )),
        TextButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.homePage);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xfff30000),
            )),
      ],
    );
  }
}

class StackImageItemsLikthes extends StatelessWidget {
  const StackImageItemsLikthes({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ItemsLikeThesController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: Get.height / 2.5,
          child: Image.network(
            controller.movieModel.poster!,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: double.infinity,
          height: Get.height / 2.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, Color(0xff1d1d1d)],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextApp(title: controller.movieModel.title!, siza: 20),
                const Text(
                  "  Available now",
                  style: TextStyle(
                      color: Color(0xfff30000), fontWeight: FontWeight.bold),
                )
              ],
            )),
        TextButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.homePage);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xfff30000),
            )),
      ],
    );
  }
}
