import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/dashboard/dashboard_screen.dart';
import 'package:build_planner/modules/app_drawer.dart';
import 'package:build_planner/modules/products/products_screen.dart';
import 'package:build_planner/modules/search/search_screen.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  List<Map<String, Object>> _page = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 3) _scaffoldKey.currentState!.openEndDrawer();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _page = [
      {
        StringConstants.pageHead: DashboardScreen(),
        StringConstants.titleHead: StringConstants.dashboardTabHead,
      },
      {
        StringConstants.pageHead: ProductsScreen(),
        StringConstants.titleHead: StringConstants.productsTabHead,
      },
      {
        StringConstants.pageHead: SearchScreen(),
        StringConstants.titleHead: StringConstants.searchTabHead,
      },
      {
        StringConstants.pageHead: DashboardScreen(),
        StringConstants.titleHead: StringConstants.moreTabHead,
      },
    ];
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
//        appBar: AppBar(
//          backgroundColor: Theme.of(context).primaryColorDark,
//          title: Text(
//            (_page[_selectedPageIndex]['title'] as String).toUpperCase(),
//            style: TextStyle(color: Colors.white),
//          ),
//        ),
        key: _scaffoldKey,
        endDrawer: AppDrawer(
          fromBottomBar: false,
        ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    head: _selectedPageIndex == 3
                        ? (_page[0][StringConstants.titleHead] as String)
                        : (_page[_selectedPageIndex][StringConstants.titleHead]
                            as String),
                  ),
                  if (_selectedPageIndex != 3)
                    _page[_selectedPageIndex][StringConstants.pageHead]
                        as Widget,
                  if (_selectedPageIndex == 3)
                    _page[0][StringConstants.pageHead] as Widget
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: !ResponsiveWidget.isLargeScreen(context)
            ? new Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Theme.of(context).primaryColorDark,
                  // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                  primaryColor: Colors.red,
                ),
                child: _buildBottomNavigation(),
              )
            : null,
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      onTap: _selectPage,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).backgroundColor,
      currentIndex: _selectedPageIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: StringConstants.dashboardTabHead,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
          ),
          label: StringConstants.productsTabHead,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: StringConstants.searchTabHead,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more,
          ),
          label: StringConstants.moreTabHead,
        ),
      ],
    );
  }
}

//                      if (_selectedPageIndex == 0 || _selectedPageIndex == 3)
//                        SizedBox(
//                          width: 45,
//                        ),
//                      if (_selectedPageIndex == 0 || _selectedPageIndex == 3)
//                        CircleAvatar(
//                          radius: 24,
//                          child: IconButton(
//                            onPressed: () {},
//                            icon: Icon(
//                              Icons.filter_list,
//                              size: 24,
//                            ),
//                          ),
//                        ),
