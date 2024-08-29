import 'package:get/get.dart';
import 'package:movies/core/class/curd.dart';
import 'package:movies/core/class/status_enum.dart';
import 'package:movies/core/data/data_move.dart';

class SearchController extends GetxController {
  MoveData moveData = MoveData(Curd());
  StatusRequest statusRequest = StatusRequest.none;
}
