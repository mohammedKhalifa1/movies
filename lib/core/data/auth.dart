import 'dart:io';

import 'package:movies/core/class/app_lik.dart';
import 'package:movies/core/class/curd.dart';

class AuthData {
  Curd curd;
  AuthData(this.curd);
  signin(String email, String password) async {
    var request = await curd
        .postData(AppLink.signin, {"email": email, "passwrod": password});
    return request;
  }

  signup(String email, String password, String userName, String phone) async {
    var request = await curd.postData(AppLink.signup, {
      "userName": userName,
      "email": email,
      "passwrod": password,
      "phone": phone,
    });
    return request;
  }

  choseImage(Map data, [File? file]) async {
    var request;
    if (file == null) {
      var request = await curd.postData(AppLink.chingData, data);
    } else {
      var request = await curd.postFile(AppLink.chingData, data, file);
    }
    return request;
  }
}
