import 'package:flutter/material.dart';
import 'package:movies/core/widget/text.dart';

class CustomTextFromFieldProfile extends StatelessWidget {
  final double width;
  final String title;

  final TextEditingController? controller;

  const CustomTextFromFieldProfile({
    Key? key,
    required this.width,
    required this.title,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width, vertical: 10),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff2d2d2c),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            hintText: title,
            hintStyle: const TextStyle(color: Color(0xffbabbba)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff2d2d2c)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff2d2d2c)),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff2d2d2c)),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

class ButtonForProfile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ButtonForProfile({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff2d2d2c),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            TextApp(title: title, siza: 17),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Color(0xffbabbba),
            )
          ],
        ),
      ),
    );
  }
}
