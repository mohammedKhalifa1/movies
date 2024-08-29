import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/class/status_enum.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset('assets/lottie/loading.json', height: 150),
          )
        : statusRequest == StatusRequest.failure
            ? Center(
                child: Lottie.asset('assets/lottie/fail.json'),
              )
            : statusRequest == StatusRequest.noData
                ? Center(
                    child: Lottie.asset('assets/lottie/fail.json'),
                  )
                : statusRequest == StatusRequest.offLine
                    ? Center(
                        child: Lottie.asset('assets/lottie/fail.json'),
                      )
                    : widget;
  }
}
