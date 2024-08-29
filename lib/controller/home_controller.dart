import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/curd.dart';
import 'package:movies/core/class/movie_model.dart';
import 'package:movies/core/class/status_enum.dart';
import 'package:movies/core/data/data_move.dart';
import '../core/class/app_route.dart';

class HomeController extends GetxController {
  final String test = 'asd';
  //  String wr = "This is a sentence";
  // String firstWord = wr.split("").first; //split(" ").first;

  StatusRequest statusRequest = StatusRequest.none;
  final List<MovieModel> allMovie = [];
  final List<MovieModel> actionMovie = [];
  final List<MovieModel> kidsMovie = [];
  final List<MovieModel> islamMovie = [];
  final List<MovieModel> animeMovie = [];
  final List<MovieModel> dramaMovie = [];
  final List<MovieModel> newMovie = [];
  final List<MovieModel> popularMovie = [];
  final List<MovieModel> syrianMovie = [];
  MovieModel? movieModel;
  late TextEditingController searchController;
  final Random random = Random();
  late int randomNam;
  MoveData moveData = MoveData(Curd());
  final List<MovieModel> searchList = [];
  bool checkData = false;

  search() async {
    statusRequest = StatusRequest.loading;
    update();
    var request = await moveData.getData(searchController.text);
    if (request['Response'] == "True") {
      searchList.clear();

      List data = request['Search'];
      searchList.addAll(data.map((e) => MovieModel.fromJson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.noData;
    }
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var syria = await moveData.getData('syria');
    var drama = await moveData.getData('warriors');
    var anime = await moveData.getData('anime');
    var action = await moveData.getData('action');
    var kids = await moveData.getData('kids');
    var islam = await moveData.getData('islam');
    var all = await moveData.getData('all');
    var neow = await moveData.getData('new');
    var popular = await moveData.getData('popular');
    if (drama['Response'] == "True") {
      List dr = drama['Search'];
      dramaMovie.addAll(dr.map((e) => MovieModel.fromJson(e)));
      List po = popular['Search'];
      List ne = neow['Search'];
      List an = anime['Search'];
      List ac = action['Search'];
      List ki = kids['Search'];
      List isl = islam['Search'];
      List sy = syria['Search'];
      List al = all['Search'];
      syrianMovie.addAll(sy.map((e) => MovieModel.fromJson(e)));
      popularMovie.addAll(po.map((e) => MovieModel.fromJson(e)));
      allMovie.addAll(al.map((e) => MovieModel.fromJson(e)));
      newMovie.addAll(ne.map((e) => MovieModel.fromJson(e)));
      animeMovie.addAll(an.map((e) => MovieModel.fromJson(e)));
      actionMovie.addAll(ac.map((e) => MovieModel.fromJson(e)));
      kidsMovie.addAll(ki.map((e) => MovieModel.fromJson(e)));
      islamMovie.addAll(isl.map((e) => MovieModel.fromJson(e)));

      movieModel?.title = dr[randomNam]['Search']['Title'];
      movieModel?.year = dr[randomNam]['Search']['Year'];
      movieModel?.imdbID = dr[randomNam]['Search']['imdbID'];
      movieModel?.type = dr[randomNam]['Search']['Type'];
      movieModel?.poster = dr[randomNam]['Search']['Poster'];

      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.offLine;
    }
    update();
  }

  goToTheItems(MovieModel movie) {
    Get.toNamed(AppRoute.items, arguments: {"movie": movie});
  }

  check(val) {
    if (val == '') {
      checkData = false;
    } else {
      checkData = true;
    }
    update();
  }

  // List<Widget> widgey = [const All(), const Movies()];
  // List<String> title = ['All', 'movies'];
  @override
  void onInit() {
    getData();
    searchController = TextEditingController();

    randomNam = random.nextInt(10);

    super.onInit();
  }
}
