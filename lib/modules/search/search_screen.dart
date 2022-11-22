import 'package:build_planner/base/custom_search_tile.dart';
import 'package:build_planner/modules/dashboard/controller/build_controller.dart';
import 'package:build_planner/modules/dashboard/dashboard_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<BuildController> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CustomSearchTile(
            textEditingController: _textEditingController,
            onPressed: () {},
            onChange: (value) {
              controller.buildListBySearch(value);
            },
          ),
        ),
//        Obx(() => Text(controller.buildBySearch.length.toString())),
        GetBuilder<BuildController>(
          builder: (buildData) => Container(
            height: Get.height * 0.72,
            width: Get.width * 0.7,
            child: ListView.builder(
              itemCount: buildData.buildBySearch.length,
              itemBuilder: (context, index) => DashboardTile(
                buildModel: buildData.buildBySearch[index],
              ),
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ],
    );
  }
}