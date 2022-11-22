import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/issues/controllers/document/document_controller.dart';
import 'package:build_planner/modules/issues/controllers/estimate/estimate_controller.dart';
import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/modules/issues/controllers/notify/notify_controller.dart';
import 'package:build_planner/modules/issues/issue_mobile/document_tile.dart';
import 'package:build_planner/modules/issues/issue_mobile/estimate_tile.dart';
import 'package:build_planner/modules/issues/issue_mobile/issue_details_tile.dart';
import 'package:build_planner/modules/issues/issue_web/issues_web_screen.dart';
import 'package:build_planner/modules/issues/issue_mobile/notify_tile.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:build_planner/utils/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueScreen extends StatelessWidget {
  final IssueModel issueModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ? IssuesWebScreen(
            issueModel: issueModel,
          )
        : SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: CustomPadding.paddingBottom8Right8,
                    child: CustomAppBar(
                      head: issueModel.issueID,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: CustomPadding.commonPadding8,
                      child: Container(
                          height: Get.height * 0.85,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              IssueDetailsTile(
                                issueModel: issueModel,
                              ),
//                              buildDisplayProductTile(context),
//                            buildStatusTile(context),
                              GetBuilder<NotifyController>(
                                init: NotifyController(),
                                builder: (notifyData) =>
                                    NotifyTile(issueId: issueModel.issueID),
                              ),
                              GetBuilder<DocumentController>(
                                init: DocumentController(),
                                builder: (notifyData) =>
                                    DocumentTile(issueId: issueModel.issueID),
                              ),
//                            buildDocumentTile(context),
                              GetBuilder<EstimateController>(
                                init: EstimateController(),
                                builder: (notifyData) =>
                                    EstimateTile(issueId: issueModel.issueID),
                              ),
//                            buildEstimateTile(context),
                            ],
                          )
//                      !ResponsiveWidget.isLargeScreen(context)
//                        ?
//                          : Padding(
//                              padding: CustomPadding.commonPadding20,
//                              child: GridView(
//                                gridDelegate:
//                                    SliverGridDelegateWithMaxCrossAxisExtent(
//                                  maxCrossAxisExtent: deviceSize.height,
//                                  childAspectRatio: 2.8,
//                                  crossAxisSpacing: 50,
//                                  mainAxisSpacing: 50,
//                                ),
//                                children: [
//                                  buildIssueDetailsTile(context),
//                                  buildDisplayProductTile(context),
//                                  buildStatusTile(context),
//                                  buildNotifyTile(context),
//                                  buildDocumentTile(context),
//                                  buildEstimateTile(context),
//                                ],
//                              ),
//                            ),
                          ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                child: Icon(
                  Icons.history,
                  size: 30,
                ),
                onPressed: () =>
//                !ResponsiveWidget.isLargeScreen(context)
//                    ?
                    Get.toNamed(
                  RouteConstants.logsScreen,
                  arguments: issueModel,
                ),
//                    : Get.toNamed(
//                        RouteConstants.logsWebScreen,
//                      ),
              ),
            ),
          );
  }
}
