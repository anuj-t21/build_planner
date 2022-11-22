import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveWidget extends GetResponsiveView {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  ResponsiveWidget({
//    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  });

  static bool isSmallScreen(BuildContext context) {
    return context.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return context.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return context.width >= 800 && context.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
