import 'package:flutter/material.dart';

class CustomContainerButtton extends StatelessWidget {
  final double margenHorizontal;
  final double margenVertical;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final double hight;
  const CustomContainerButtton({
    Key? key,
    required this.margenHorizontal,
    required this.margenVertical,
    required this.title,
    required this.onTap,
    required this.color,
    required this.hight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: margenHorizontal, vertical: margenVertical),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: hight,
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
