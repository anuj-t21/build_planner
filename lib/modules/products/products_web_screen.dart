import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/app_drawer.dart';
import 'package:build_planner/modules/products/products_screen.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProductsWebScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Row(
          children: [
            if (ResponsiveWidget.isLargeScreen(context))
              AppDrawer(
                fromBottomBar: true,
              ),
            if (ResponsiveWidget.isLargeScreen(context))
              SizedBox(
                width: 20,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(head: StringConstants.productsTabHead),
                  ProductsScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
