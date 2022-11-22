import 'package:build_planner/utils/constants/theme_constatns.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  List<ThemeData> _themeList = ThemeConstants.themeList;
  List<String> _themeName = ThemeConstants.themeName;

  var selectedTheme = ThemeConstants.defaultTheme;

  List get myThemeList => [..._themeList];
  List get myThemeName => [..._themeName];

  void setTheme(int index) {
    selectedTheme = _themeList[index];
    update();
  }
}
