import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/app_route.dart';
import 'package:movies/core/class/curd.dart';
import 'package:movies/core/class/status_enum.dart';
import 'package:movies/core/class/user_model.dart';
import 'package:movies/core/data/auth.dart';
import 'package:movies/main.dart';
import 'package:video_player/video_player.dart';

class SignInController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AuthData authData = AuthData(Curd());
  final List<UsersModel> userModel = [];
  late TextEditingController email;
  late TextEditingController password;

  signin() async {
    final bool isValid = EmailValidator.validate(email.text);
    if (isValid == true) {
      statusRequest = StatusRequest.loading;
      update();
      var request = await authData.signin(email.text, password.text);
      if (request['status'] == 'success') {
        List data = request['data'];
        userModel.addAll(data.map((e) => UsersModel.fromJson(e)));
        sharedPreferences.setString("id", userModel[0].usersId.toString());
        sharedPreferences.setString("name", userModel[0].usersName.toString());
        sharedPreferences.setString(
            "phone", userModel[0].usersPhone.toString());
        sharedPreferences.setString(
            "email", userModel[0].usersEmail.toString());
        sharedPreferences.setString(
            "password", userModel[0].usersPassword.toString());
        Get.offAllNamed(AppRoute.homePage, arguments: {"userModel": userModel});
        statusRequest == StatusRequest.success;
      } else {
        Get.snackbar(
            "Warning", 'There is an error due to the email or password');
        Get.offAllNamed(AppRoute.authPage);
        statusRequest == StatusRequest.success;
      }
    } else {
      Get.snackbar("Warning", 'Email is invalid');
    }
    update();
  }

//_____________
  late VideoPlayerController videocontroller;

  // Future vidoshow() async {
  //   videocontroller = VideoPlayerController.network(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
  //   await videocontroller.initialize();
  // }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
