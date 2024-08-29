import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/app_route.dart';
import 'package:movies/core/class/handling_data_view.dart';

import '../../controller/signup_controller.dart';
import '../../core/widget/custom_buttom.dart';
import '../../core/widget/custom_image_logo.dart';
import '../../core/widget/custom_text_button.dart';
import '../../core/widget/custom_text_from_faild.dart';
import '../../core/widget/text.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              const TextApp(title: "Already have an account ?", siza: 17),
              custom_text_button(
                  title: "LogIn",
                  onTap: () {
                    Get.toNamed(AppRoute.authPage);
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Center(child: TextApp(title: "welcome back!", siza: 20)),
        ),
        body: GetBuilder<SignupController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextFromField(
                    controller: controller.userName,
                    width: 40,
                    title: "Full name",
                    icon: Icons.home),
                CustomTextFromField(
                    controller: controller.email,
                    width: 40,
                    title: "your email",
                    icon: Icons.home),
                CustomTextFromField(
                  controller: controller.phone,
                  width: 40,
                  title: "Phone number",
                  icon: Icons.home,
                ),
                CustomTextFromField(
                    controller: controller.password,
                    width: 40,
                    title: "Create your password",
                    active: true,
                    icon: Icons.home),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    custom_text_button(title: "Forget password", onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomContainerButtton(
                  color: const Color(0xfff30000),
                  hight: 50,
                  margenHorizontal: 40,
                  margenVertical: 0,
                  onTap: () {
                    controller.signup();
                  },
                  title: "create",
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color(0xffbabbba),
                          thickness: 0.2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextApp(
                          title: 'Or signup with',
                          siza: 15,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xffbabbba),
                          thickness: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customimage(
                        image: "assets/images/google.png", onTap: () {}),
                    const SizedBox(
                      width: 5,
                    ),
                    Customimage(image: "assets/images/face.png", onTap: () {}),
                    const SizedBox(
                      width: 5,
                    ),
                    Customimage(image: "assets/images/mac.png", onTap: () {}),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
