import 'package:build_planner/base/custom_tile_drawer.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  final bool fromBottomBar;
  AppDrawer({required this.fromBottomBar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
              ),
              child: Padding(
                padding: CustomPadding.commonPadding8,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/51/600',
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    Padding(
                      padding: CustomPadding.commonPadding8,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'USERNAME',
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'POSITION',
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: ColorConstants.cardColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTileDrawer(
                      icon: Icons.home,
                      title: StringConstants.dashboardTabHead.toUpperCase(),
                      onTap: () {},
                    ),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                    ),
                    if (fromBottomBar)
                      CustomTileDrawer(
                        icon: Icons.category,
                        title: StringConstants.productsTabHead.toUpperCase(),
                        onTap: () =>
                            Get.toNamed(RouteConstants.productsWebScreen),
                      ),
                    if (fromBottomBar)
                      Divider(
                        color: Theme.of(context).backgroundColor,
                      ),
                    if (fromBottomBar)
                      CustomTileDrawer(
                        icon: Icons.search,
                        title: StringConstants.searchTabHead.toUpperCase(),
                        onTap: () =>
                            Get.toNamed(RouteConstants.searchWebScreen),
                      ),
                    if (fromBottomBar)
                      Divider(
                        color: Theme.of(context).backgroundColor,
                      ),
                    CustomTileDrawer(
                      icon: Icons.format_align_left,
                      title: StringConstants.aboutUsTabHead.toUpperCase(),
                      onTap: () => Get.toNamed(RouteConstants.aboutUsScreen),
                    ),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                    ),
                    CustomTileDrawer(
                      icon: Icons.settings,
                      title: StringConstants.themeTabHead.toUpperCase(),
                      onTap: () =>
                          Get.toNamed(RouteConstants.themeSettingsScreen),
                    ),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                    ),
                    CustomTileDrawer(
                      icon: Icons.logout,
                      title: StringConstants.logoutTabHead.toUpperCase(),
                      onTap: () {},
                    ),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
