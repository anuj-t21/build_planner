//import 'package:build_planner/base/custom_app_bar.dart';
//import 'package:build_planner/controllers/issue/issue_model.dart';
//import 'package:build_planner/controllers/logs/logs_controller.dart';
//import 'package:build_planner/modules/app_drawer.dart';
//import 'package:build_planner/modules/issue_drawer.dart';
//import 'package:build_planner/modules/logs/logs_screen.dart';
//import 'package:build_planner/modules/logs/logs_widget.dart';
//import 'package:build_planner/modules/products/products_screen.dart';
//import 'package:build_planner/utils/responsive.dart';
//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//
//class LogsWebScreen extends StatelessWidget {
//  final IssueModel issueModel;
//  LogsWebScreen({required this.issueModel});
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Theme.of(context).backgroundColor,
//        body: Row(
//          children: [
//            if (ResponsiveWidget.isLargeScreen(context))
//              IssueDrawer(
//                issueModel: issueModel,
//              ),
//            if (ResponsiveWidget.isLargeScreen(context))
//              SizedBox(
//                width: 20,
//              ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                CustomAppBar(head: 'Logs'),
//                GetBuilder<LogsController>(
//                  init: LogsController(),
//                  builder: (_) => LogsWidget(
//                    issueId: issueModel.issueID,
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
