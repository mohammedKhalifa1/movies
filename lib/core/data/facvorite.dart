import 'package:movies/core/class/app_lik.dart';
import 'package:movies/core/class/curd.dart';
import 'package:movies/main.dart';

class FavoriteData {
  Curd curd;
  FavoriteData(this.curd);
  add(
    String image,
    String year,
    String im,
    String title,
  ) async {
    var request = await curd.postData(AppLink.addFavorite, {
      "userId": sharedPreferences.getString('id'),
      "image": image,
      "year": year,
      "im": im,
      "title": title,
    });
    return request;
  }

  view() async {
    var request = await curd.postData(AppLink.viewFavorite, {
      "userId": sharedPreferences.getString('id'),
    });
    return request;
  }

  delete(String favoritId) async {
    var request = await curd.postData(AppLink.deleteFavorite,
        {"userId": sharedPreferences.getString('id'), "favId": favoritId});
    return request;
  }
}
