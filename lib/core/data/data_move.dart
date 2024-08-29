import 'package:movies/core/class/app_lik.dart';
import 'package:movies/core/class/curd.dart';

class MoveData {
  Curd curd;
  MoveData(this.curd);
  getData(String name) async {
    var request = await curd.postData("${AppLink.movieSearch}$name", {});
    return request;
  }
}
