import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/profile_conroller.dart';
import 'package:movies/core/widget/custom_text_button.dart';
import 'package:movies/core/widget/text.dart';

import '../../core/widget/custom_text_from_faild_for_proelie.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<ProfileController>(
        builder: (controller) => ListView(
          children: [
            custom_text_button(
                title: "Chose your Image",
                onTap: () {
                  controller.choseImage();
                }),
            if (controller.file != null)
              Image.file(
                controller.file!,
                height: 100,
              ),
            if (controller.file == null)
              SizedBox(
                height: 100,
              ),
            CustomTextFromFieldProfile(
              width: 10,
              title: "Name",
              controller: controller.userName,
            ),
            CustomTextFromFieldProfile(
              width: 10,
              title: "Email",
              controller: controller.email,
            ),
            CustomTextFromFieldProfile(
              width: 10,
              title: "Phone",
              controller: controller.phone,
            ),
            CustomTextFromFieldProfile(
              width: 10,
              title: "Password",
              controller: controller.password,
            ),
            // TextApp(title: "    Chose your Image", siza: 13),
          ],
        ),
      ),
    );
  }
}
