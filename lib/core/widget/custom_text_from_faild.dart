import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final double width;
  final String title;
  final IconData icon;
  final TextEditingController? controller;
  final bool? active;
  const CustomTextFromField({
    Key? key,
    required this.width,
    required this.title,
    required this.icon,
    this.controller,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width, vertical: 10),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        obscureText: active == false || active == null ? false : true,
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
