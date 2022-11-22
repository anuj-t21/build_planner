import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/modules/logs/controller/logs_controller.dart';
import 'package:build_planner/modules/logs/logs_widget.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogsScreen extends StatelessWidget {
  final IssueModel issueModel = Get.arguments;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return
//      ResponsiveWidget.isLargeScreen(context)
//        ? LogsWebScreen(
//            issueModel: issueModel,
//          )
//        :
        SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: CustomPadding.paddingBottom8Right8,
              child: CustomAppBar(
                head: StringConstants.logsScreenHead,
              ),
            ),
            GetBuilder<LogsController>(
              init: LogsController(),
              builder: (_) => LogsWidget(
                issueId: issueModel.issueID,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
