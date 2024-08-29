import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final double width;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool? active;
  final void Function(String)? onChanged;
  const CustomSearch({
    Key? key,
    required this.width,
    required this.title,
    required this.icon,
    this.controller,
    this.active,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width, vertical: 10),
      child: TextFormField(
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        onChanged: onChanged,
        controller: controller,
        obscureText: active == false || active == null ? false : true,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: onTap,
                icon: Icon(
                  icon,
                  color: const Color(0xffbabbba),
                )),
            filled: true,
            fillColor: const Color(0xff2d2d2c).withOpacity(0.5),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            hintText: title,
            hintStyle: const TextStyle(color: Color(0xffbabbba)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff2d2d2c)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
