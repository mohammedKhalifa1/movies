import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:movies/core/class/user_model.dart';
import 'package:movies/main.dart';

import '../core/function/upload_file.dart';

class ProfileController extends GetxController {
  String test = '0';

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  File? file;
  choseImage() async {
    file = await uploadImage();
    update();
  }

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    userName.text = sharedPreferences.getString('name')!;
    email.text = sharedPreferences.getString('email')!;
    password.text = sharedPreferences.getString('password')!;
    phone.text = sharedPreferences.getString('phone')!;
    super.onInit();
  }
}
