import 'package:flutter/material.dart';

class Customimage extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;
  const Customimage({
    Key? key,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 40,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color(0xff2d2d2c)),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
