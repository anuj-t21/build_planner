import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String head;

  CustomAppBar({required this.head});
  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: ResponsiveWidget.isLargeScreen(context)
          ? Get.width * 0.78
          : Get.width, //deviceSize.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
//        borderRadius: StyleConstants.bottomRightBorder16,
      ),
      child: Center(
        child: Text(
          head.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
