import 'package:get/get.dart';
import 'package:movies/core/class/curd.dart';
import 'package:movies/core/class/movie_model.dart';
import 'package:movies/core/class/status_enum.dart';
import 'package:movies/core/data/data_move.dart';

import '../core/class/app_route.dart';
import '../core/data/facvorite.dart';

class ItemsLikeThesController extends GetxController {
  FavoriteData addToFavorite = FavoriteData(Curd());
  late MovieModel movieModel;
  StatusRequest statusRequest = StatusRequest.none;
  MoveData moveData = MoveData(Curd());
  List<MovieModel> movies = [];
  likMovie() async {
    statusRequest = StatusRequest.loading;
    update();
    String firstWord =
        movieModel.title!.substring(0, movieModel.title!.indexOf(' '));
    var request = await moveData.getData(firstWord);
    if (request['Response'] == 'True') {
      List data = request['Search'];
      movies.addAll(data.map((e) => MovieModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.noData;
    }
    update();
  }

  add() async {
    update();
    var request = await addToFavorite.add(movieModel.poster!, movieModel.year!,
        movieModel.imdbID!, movieModel.title!);
    if (request['status'] == 'success') {
      print("success");
      statusRequest = StatusRequest.success;
      Get.snackbar("Done", "The clip has been saved to watch later");
    } else {
      print("fail");
      statusRequest = StatusRequest.success;
      Get.snackbar("failure", "try again");
    }
    update();
  }

  goToTheItems(MovieModel movie) {
    Get.offAllNamed(AppRoute.items, arguments: {"movie": movie});
  }

  goToTheMoreMoveLikeItems(MovieModel movie) {
    Get.offAllNamed(AppRoute.itemsMoreLikeThies, arguments: {"movie": movie});
  }

  @override
  void onInit() {
    movieModel = Get.arguments['movie'];
    likMovie();
    super.onInit();
  }
}
