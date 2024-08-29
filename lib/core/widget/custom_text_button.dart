import 'package:flutter/material.dart';

class custom_text_button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  const custom_text_button({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(color: color),
        ));
  }
}
