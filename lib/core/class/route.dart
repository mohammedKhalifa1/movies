import 'package:get/get.dart';
import 'package:movies/core/class/app_route.dart';
import 'package:movies/core/class/test.dart';
import 'package:movies/view/widget/items.dart';
import 'package:movies/view/widget/more_like_this.dart';
import 'package:movies/view/widget/profile_edit.dart';

import '../../view/app/homePage.dart';
import '../../view/auth/signin.dart';
import '../../view/auth/signup.dart';

List<GetPage<dynamic>>? route = [
  GetPage(name: AppRoute.authPage, page: () => const SignIn()),
  GetPage(name: AppRoute.signup, page: () => const Signup()),
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.profileEdit, page: () => const ProfileEdit()),
  GetPage(
      name: AppRoute.itemsMoreLikeThies, page: () => const ItemsMoreLikeThis()),
  // GetPage(name: "/", page: () => ShowVideo())
];
