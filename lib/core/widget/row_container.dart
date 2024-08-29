import 'package:flutter/material.dart';

class RowContenare extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final Color colorText;
  final Color colorContainer;
  final Color colorBorder;

  const RowContenare({
    Key? key,
    required this.title,
    required this.onTap,
    required this.colorText,
    required this.colorContainer,
    required this.icon,
    required this.colorBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: colorBorder)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: colorText),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
