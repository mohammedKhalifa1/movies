import 'package:flutter/material.dart';

class OneMovieForShow extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const OneMovieForShow({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
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
