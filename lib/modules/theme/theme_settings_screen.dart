import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/theme/theme_controller.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSettings extends StatelessWidget {
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(head: StringConstants.themeScreenHead),
            Container(
              padding: CustomPadding.paddingrtb20,
              height: Get.height * 0.85,
              child: ListView.builder(
                itemCount: _themeController.myThemeList.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: CustomPadding.commonPadding4,
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      onTap: () => _themeController.setTheme(index),
                      title: Text(
                        _themeController.myThemeName[index].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: _themeController.selectedTheme ==
                              _themeController.myThemeList[index]
                          ? Icon(
                              Icons.radio_button_checked,
                              color: Theme.of(context).primaryColorDark,
                            )
                          : Icon(Icons.radio_button_unchecked),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
