import 'package:build_planner/modules/about_us/about_us_screen.dart';
import 'package:build_planner/modules/bottom_tabs.dart';
import 'package:build_planner/modules/dashboard/dashboard_screen.dart';
import 'package:build_planner/modules/issues/issue_mobile/issue_screen.dart';
import 'package:build_planner/modules/logs/logs_screen.dart';
import 'package:build_planner/modules/products/products_screen.dart';
import 'package:build_planner/modules/products/products_web_screen.dart';
import 'package:build_planner/modules/search/search_screen.dart';
import 'package:build_planner/modules/search/search_web_screen.dart';
import 'package:build_planner/modules/theme/theme_settings_screen.dart';
import 'package:build_planner/utils/router/route_constants.dart';
import 'package:get/get.dart';

class AppRouter {
  List<GetPage> getPage = [
    GetPage(
      name: RouteConstants.dashboardScreen,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: RouteConstants.bottomTabs,
      page: () => BottomTabs(),
    ),
    GetPage(
      name: RouteConstants.themeSettingsScreen,
      page: () => ThemeSettings(),
    ),
    GetPage(
      name: RouteConstants.productsScreen,
      page: () => ProductsScreen(),
    ),
    GetPage(
      name: RouteConstants.productsWebScreen,
      page: () => ProductsWebScreen(),
    ),
    GetPage(
      name: RouteConstants.searchScreen,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: RouteConstants.searchWebScreen,
      page: () => SearchWebScreen(),
    ),
    GetPage(
      name: RouteConstants.issueScreen,
      page: () => IssueScreen(),
    ),
    GetPage(
      name: RouteConstants.logsScreen,
      page: () => LogsScreen(),
    ),
    GetPage(
      name: RouteConstants.aboutUsScreen,
      page: () => AboutUs(),
    ),
  ];
}
