import 'package:flutter/material.dart';
import 'package:movies/core/widget/text.dart';

import '../../controller/items_controller.dart';
import '../../controller/items_like_thes_controller.dart';

class RowItemsDetails extends StatelessWidget {
  const RowItemsDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ItemsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextApp(
            title: "yeer ${controller.movieModel.year!} /",
            siza: 15,
            fontWeight: FontWeight.w500,
          ),
          TextApp(
            title: "imdbID ${controller.movieModel.imdbID!}",
            siza: 15,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          const Icon(
            Icons.star_rate_rounded,
            size: 20,
            color: Color(0xfff30000),
          ),
          const Text(
            '4.',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xfff30000)),
          ),
          const Text(
            '5',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xfff30000)),
          )
        ],
      ),
    );
  }
}

class RowItemsDetailsLikThes extends StatelessWidget {
  const RowItemsDetailsLikThes({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ItemsLikeThesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextApp(
            title: "yeer ${controller.movieModel.year!} /",
            siza: 15,
            fontWeight: FontWeight.w500,
          ),
          TextApp(
            title: "imdbID ${controller.movieModel.imdbID!}",
            siza: 15,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          const Icon(
            Icons.star_rate_rounded,
            size: 20,
            color: Color(0xfff30000),
          ),
          const Text(
            '4.',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xfff30000)),
          ),
          const Text(
            '5',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xfff30000)),
          )
        ],
      ),
    );
  }
}
