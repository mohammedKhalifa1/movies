import 'package:flutter/material.dart';

class RowContenare extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;

  const RowContenare({
    Key? key,
    required this.title,
    required this.onTap,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: active == true ? Colors.red : Colors.white)),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(color: active == true ? Colors.red : Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
