import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/view/app/download.dart';
import 'package:movies/view/app/home.dart';
import 'package:movies/view/app/protfile.dart';
import '../view/app/notificition.dart';

class HomePageBottpm extends GetxController {
  bool active = false;
  int count = 0;
  changeCount(int val) {
    count = val;
    update();
  }

  changeActive() {
    active = active == false ? true : false;
    update();
  }

  List<Map> title = [
    {"title": "Home", "icon": Icons.home_filled},
    {"title": "Watch later", "icon": Icons.watch_later_outlined},
    {"title": "profile", "icon": Icons.person},
  ];
  List<Widget> widget = [
    const Home(),
    const Later(),
    const Protfile(),
  ];
}
    // {"title": "Download", "icon": Icons.file_download_outlined},
        // const Download(),