import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/handling_data_view.dart';
import 'package:movies/core/class/movie_model.dart';
import 'package:movies/core/widget/text.dart';
import '../../controller/items_like_thes_controller.dart';
import '../../core/widget/row_container.dart';
import '../../core/widget/row_items_details.dart';
import '../../core/widget/stack_items_image.dart';

class ItemsMoreLikeThis extends StatelessWidget {
  const ItemsMoreLikeThis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsLikeThesController controller = Get.put(ItemsLikeThesController());
    return Scaffold(
      body: ListView(
        children: [
          StackImageItemsLikthes(controller: controller),
          const SizedBox(
            height: 30,
          ),
          RowItemsDetailsLikThes(controller: controller),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowContenare(
                  colorBorder: Colors.white,
                  icon: Icons.watch_later_outlined,
                  title: "Watch later",
                  onTap: () {
                    controller.add();
                  },
                  colorContainer: Colors.transparent,
                  colorText: Colors.white),
              RowContenare(
                  colorBorder: const Color(0xfff30000),
                  icon: Icons.play_arrow_rounded,
                  title: "Play",
                  onTap: () {},
                  colorContainer: const Color(0xfff30000),
                  colorText: Colors.white),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const TextApp(
            title: "    More like this",
            siza: 15,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<ItemsLikeThesController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.movies.length,
                    itemBuilder: (context, index) => MoreMoveLikeItems(() {
                      controller.goToTheItems(controller.movies[index]);
                    }, data: controller.movies[index]),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class MoreMoveLikeItems extends GetView<ItemsLikeThesController> {
  final MovieModel data;
  final void Function()? onTap;

  const MoreMoveLikeItems(
    this.onTap, {
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: 150,
        height: 200,
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  data.poster!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextApp(title: data.title!, siza: 10),
            TextApp(title: "type : ${data.type!}", siza: 10)
          ],
        ),
      ),
    );
  }
}
