// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:our_screen/controller/home_controller.dart';
// import 'package:our_screen/core/class/handling_data_view.dart';

// import '../../core/widget/firs_movie.dart';
// import '../../core/widget/socand_contaenr.dart';
// import '../../core/widget/text.dart';

// class Movies extends StatelessWidget {
//   const Movies({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       builder: (controller) {
//         HomeController controller = Get.put(HomeController());
//         return HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: ListView(
//               children: [
//                 SizedBox(
//                   height: 150,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: controller.allMovie.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return FirstRowMovie(
//                           onTap: () {},
//                           imageUrl: controller.allMovie[index].poster!);
//                     },
//                   ),
//                 ),
//                 const TextApp(title: "   New Releases", siza: 15),
//                 SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: controller.newMovie.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return SecondChoice(
//                           onTap: () {},
//                           imageUrl: controller.newMovie[index].poster!);
//                     },
//                   ),
//                 ),
//                 const TextApp(title: "   poplure", siza: 15),
//                 SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: controller.popularMovie.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return SecondChoice(
//                           onTap: () {},
//                           imageUrl: controller.popularMovie[index].poster!);
//                     },
//                   ),
//                 ),
//                 const TextApp(title: "   anime", siza: 15),
//                 SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: controller.animeMovie.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return SecondChoice(
//                           onTap: () {},
//                           imageUrl: controller.actionMovie[index].poster!);
//                     },
//                   ),
//                 ),
//                 const TextApp(title: "   love", siza: 15),
//                 SizedBox(
//                   height: 180,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: controller.loveMovie.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return SecondChoice(
//                           onTap: () {},
//                           imageUrl: controller.loveMovie[index].poster!);
//                     },
//                   ),
//                 ),
//               ],
//             ));
//       },
//     );
//   }
// }
