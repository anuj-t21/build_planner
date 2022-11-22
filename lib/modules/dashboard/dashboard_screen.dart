import 'package:build_planner/modules/dashboard/controller/build_controller.dart';
import 'package:build_planner/modules/dashboard/dashboard_tile.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return GetBuilder<BuildController>(
        init: BuildController(),
        builder: (buildData) {
          return Container(
            height: ResponsiveWidget.isLargeScreen(context)
                ? Get.height * 0.9
                : Get.height * 0.82,
            width: ResponsiveWidget.isLargeScreen(context)
                ? Get.width * 0.75
                : Get.width,
            child: buildData.isFetching.value
                ? Center(child: CircularProgressIndicator())
                : ResponsiveWidget.isLargeScreen(context)
                    ? StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: buildData.buildModel.length,
                        itemBuilder: (BuildContext context, int index) =>
                            DashboardTile(
                          buildModel: buildData.buildModel[index],
                        ),
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.fit(2);
//                          return StaggeredTile.count(
//                            2,
//                            index.isEven ? 2 : 1,
//                          );
                        },
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      )
                    :

//                    ? GridView.builder(
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                          crossAxisCount: 3,
//                          childAspectRatio: 4 / 2,
//                          crossAxisSpacing: 20,
//                          mainAxisSpacing: 20,
//                        ),
//                        itemCount: buildData.buildModel.length,
//                        itemBuilder: (context, index) => DashboardTile(
//                          buildModel: buildData.buildModel[index],
//                        ),
//                        scrollDirection: Axis.vertical,
//                      )
//                    :
                    ListView.builder(
                        itemCount: buildData.buildModel.length,
                        itemBuilder: (context, index) => DashboardTile(
                          buildModel: buildData.buildModel[index],
                        ),
                        scrollDirection: Axis.vertical,
                      ),
          );
//          );
        });
  }
}
