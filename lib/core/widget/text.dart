import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String title;
  final TextAlign? align;
  final Color? color;
  final FontWeight? fontWeight;

  final double siza;
  const TextApp({
    Key? key,
    required this.title,
    required this.siza,
    this.align,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
          color: color ?? Colors.white, fontSize: siza, fontWeight: fontWeight),
    );
  }
}
