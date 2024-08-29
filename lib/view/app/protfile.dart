import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:movies/controller/profile_conroller.dart';
import 'package:movies/core/class/app_route.dart';
import 'package:movies/core/widget/text.dart';
import 'package:movies/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widget/custom_text_from_faild_for_proelie.dart';

class Protfile extends StatelessWidget {
  const Protfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: TextApp(
            title: 'profile',
            siza: 17,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 75,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.transparent,
                        Color(0xfff30000),
                        Colors.transparent
                      ])),
                    ),
                  ),
                  Center(child: ImageProfile()),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextApp(title: sharedPreferences.getString('name')!, siza: 15),
          const SizedBox(
            height: 5,
          ),
          TextApp(
              title: sharedPreferences.getString('email')!,
              siza: 13,
              fontWeight: FontWeight.w100,
              color: Colors.white.withOpacity(0.5)),
          const SizedBox(
            height: 25,
          ),
          ButtonForProfile(
              title: "Edit Profile",
              onTap: () {
                Get.toNamed(AppRoute.profileEdit);
              }),
          ButtonForProfile(
              title: "Help",
              onTap: () async {
                final Uri url = Uri(scheme: 'tel', path: '+201024937270');
                await launchUrl(url);
              }),
          ButtonForProfile(
              title: "Connect with us",
              onTap: () async {
                final Uri url = Uri(scheme: 'tel', path: '+201024937270');
                await launchUrl(url);
              }),
          ButtonForProfile(
              title: "Log out",
              onTap: () {
                exit(0);
              }),
        ],
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Container(
        color: Color(0xfff30000),
        padding: EdgeInsets.all(3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.network(
            "https://media.gettyimages.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=gi&k=20&c=tC514mTG014_uspJnEeJeKrQDiBY2N9GFYKPqwmtBuo=",
            height: 75,
          ),
        ),
      ),
    );
  }
}
