import 'package:build_planner/modules/theme/theme_controller.dart';
import 'package:build_planner/modules/login/login_screen.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter? appRouter;
  MyApp({@required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (value) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: StringConstants.appTitle,
            theme: value.selectedTheme,
            home: LoginScreen(),
            getPages: appRouter!.getPage,
//            onGenerateRoute: appRouter!.onGenerateRoute,
          );
        });
  }
}

// The first screen is login screen
// Login screen redirects to the
