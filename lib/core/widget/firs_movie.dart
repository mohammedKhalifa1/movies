import 'package:flutter/material.dart';

class FirstRowMovie extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const FirstRowMovie({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: 200,
                decoration: const BoxDecoration(),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
