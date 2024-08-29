import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/home_controller.dart';
import 'package:movies/core/class/app_route.dart';
import 'package:movies/core/class/handling_data_view.dart';
import 'package:movies/core/class/movie_model.dart';
import 'package:movies/core/widget/text.dart';
import '../../core/widget/custom_search.dart';
import '../../core/widget/firs_movie.dart';
import '../../core/widget/one_movie_for_show.dart';
import '../../core/widget/socand_contaenr.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controllerTow = Get.put(HomeController());
    return ListView(
      children: [
        CustomSearch(
          onChanged: (p0) {
            controllerTow.check(p0);
          },
          width: 30,
          title: "Search",
          icon: Icons.search,
          controller: controllerTow.searchController,
          onTap: () {
            controllerTow.search();
          },
        ),
        GetBuilder<HomeController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.checkData == false
                  ? ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            if (controller.dramaMovie.isNotEmpty)
                              OneMovieForShow(
                                imageUrl: controller
                                    .dramaMovie[controller.randomNam].poster!,
                                onTap: () {
                                  controller.goToTheItems(controller
                                      .dramaMovie[controller.randomNam]);
                                },
                              ),
                          ],
                        ),
                        const TextApp(title: "   Movie collection", siza: 15),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.allMovie.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return FirstRowMovie(
                                  onTap: () {
                                    controller.goToTheItems(
                                        controller.allMovie[index]);
                                  },
                                  imageUrl: controller.allMovie[index].poster!);
                            },
                          ),
                        ),
                        const TextApp(title: "   New releases", siza: 15),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.newMovie.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SecondChoice(
                                  onTap: () {
                                    controller.goToTheItems(
                                        controller.newMovie[index]);
                                  },
                                  imageUrl: controller.newMovie[index].poster!);
                            },
                          ),
                        ),
                        const TextApp(title: "   Syrian movie", siza: 15),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.syrianMovie.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                controller.syrianMovie[index].poster != "N/A"
                                    ? SecondChoice(
                                        onTap: () {
                                          controller.goToTheItems(
                                              controller.syrianMovie[index]);
                                        },
                                        imageUrl: controller
                                            .syrianMovie[index].poster!)
                                    : Container(),
                          ),
                        ),
                        const TextApp(title: "   poplure", siza: 15),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.popularMovie.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SecondChoice(
                                  onTap: () {
                                    controller.goToTheItems(
                                        controller.popularMovie[index]);
                                  },
                                  imageUrl:
                                      controller.popularMovie[index].poster!);
                            },
                          ),
                        ),
                        const TextApp(title: "   anime", siza: 15),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.animeMovie.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SecondChoice(
                                  onTap: () {
                                    controller.goToTheItems(
                                        controller.actionMovie[index]);
                                  },
                                  imageUrl:
                                      controller.actionMovie[index].poster!);
                            },
                          ),
                        ),
                        const TextApp(title: "   Islamic movies", siza: 15),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.islamMovie.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SecondChoice(
                                  onTap: () {
                                    controller.goToTheItems(
                                        controller.islamMovie[index]);
                                  },
                                  imageUrl:
                                      controller.islamMovie[index].poster!);
                            },
                          ),
                        ),
                      ],
                    )
                  : Dataforsearch(
                      data: controller.searchList,
                    )),
        )
      ],
    );
  }
}

class Dataforsearch extends StatelessWidget {
  final List<MovieModel> data;
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
          Get.toNamed(AppRoute.items, arguments: {"movie": data[index]});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  data[index].poster!,
                  height: 150,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data[index].title!.length < 35
                      ? TextApp(
                          title: "  ${data[index].title!}",
                          siza: 12,
                          fontWeight: FontWeight.bold,
                        )
                      : const Text(""),
                  const SizedBox(
                    height: 10,
                  ),
                  TextApp(
                    title: "  type ${data[index].type!}",
                    siza: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  data[index].year!.length < 30
                      ? TextApp(
                          title: "  Production year ${data[index].year!}",
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
