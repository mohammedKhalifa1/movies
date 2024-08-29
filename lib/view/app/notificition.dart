import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/favorite_model.dart';
import '../../controller/favorite_controller.dart';
import '../../core/widget/text.dart';

class Later extends StatelessWidget {
  const Later({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return GetBuilder<FavoriteController>(
      builder: (controller) => Container(
        child: controller.favoriteMaodel != null
            ? Container(child: Dataforsearch(data: controller.favoriteMaodel))
            : Center(
                child: Container(
                child: TextApp(title: "noData", siza: 20),
              )),
      ),
    );
  }
}

class Dataforsearch extends StatelessWidget {
  final List<FavoriteModel> data;
  const Dataforsearch({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          // Get.toNamed(AppRoute.items, arguments: {"movie": data[index]});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  data[index].favoritePoster!,
                  height: 150,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[index].favoriteTitle!.length < 35
                      ? TextApp(
                          title: "  ${data[index].favoriteTitle!}",
                          siza: 12,
                          fontWeight: FontWeight.bold,
                        )
                      : const Text(""),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextApp(
                    title: "  type movie}",
                    siza: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  data[index].favoriteYear!.length < 30
                      ? TextApp(
                          title:
                              "  Production year ${data[index].favoriteYear!}",
                          siza: 12,
                          fontWeight: FontWeight.bold,
                        )
                      : const Text(""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
