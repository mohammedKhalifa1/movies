// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:movies/core/class/curd.dart';
import 'package:movies/core/class/favorite_model.dart';
import 'package:movies/core/class/status_enum.dart';
import 'package:movies/core/data/facvorite.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Curd());
  StatusRequest statusRequest = StatusRequest.none;
  List<FavoriteModel> favoriteMaodel = [];
  viewFavorite() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await favoriteData.view();
    if (request['status'] == 'success') {
      List data = request['data'];
      favoriteMaodel.addAll(data.map((e) => FavoriteModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      if (favoriteMaodel == null) {
        statusRequest = StatusRequest.success;
        return 'noData';
      }
    }
    update();
  }

  @override
  void onInit() {
    viewFavorite();
    super.onInit();
  }
}
