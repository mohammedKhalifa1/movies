import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/app_route.dart';
import 'package:movies/core/class/status_enum.dart';

import '../core/class/curd.dart';
import '../core/data/auth.dart';

class SignupController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AuthData authData = AuthData(Curd());
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phone;

  signup() async {
    final bool isValid = EmailValidator.validate(email.text);
    if (isValid == true) {
      statusRequest = StatusRequest.loading;
      update();
      var request = await authData.signup(
          email.text, password.text, userName.text, phone.text);
      if (request['status'] == 'success') {
        statusRequest == StatusRequest.success;
        Get.snackbar('success', 'you have account now go to page login');
        Get.toNamed(AppRoute.authPage);
      } else {
        statusRequest == StatusRequest.failure;
      }
    } else {
      Get.snackbar("Warning", 'Email is invalid');
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
}
