//import 'dart:html';

import 'package:build_planner/base/custom_app_bar.dart';
import 'package:build_planner/modules/dashboard/controller/build_model.dart';
import 'package:build_planner/modules/issues/controllers/issue/issue_controller.dart';
import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:build_planner/utils/format_date_time.dart';
import 'package:build_planner/utils/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildIssueTile(BuildContext context, IssueModel issueModel) {
  return InkWell(
    onTap: () => Get.toNamed(
      RouteConstants.issueScreen,
      arguments: issueModel,
    ),
    child: Column(
      children: [
        Padding(
          padding: CustomPadding.commonPadding8,
          child: InkWell(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    issueModel.issueType == IssueType.IER ? 'IER' : 'ER',
                  ),
                ),
                Container(
                  width: 100,
                  child: Text(
                    issueModel.status,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Theme.of(context).backgroundColor,
        ),
      ],
    ),
  );
}

class DashboardTile extends StatelessWidget {
  final BuildModel buildModel;
  DashboardTile({required this.buildModel});

//  final IssueController _issueController = Get.put(IssueController());
  Widget buildDialogRow(String head, String tail) {
    return Container(
      width: Get.width * 0.5 * 0.7,
      padding: CustomPadding.commonPadding4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            head,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            tail,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDetailsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Container(
//          height: 240,
          width: Get.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: StyleConstants.commonBorder12,
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(head: StringConstants.buildDetails),
              Padding(
                padding: CustomPadding.commonPadding20,
                child: Column(
                  children: [
                    buildDialogRow(
                      StringConstants.buildIDHead,
                      buildModel.buildId,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildDialogRow(
                      StringConstants.buildNameHead,
                      buildModel.buildName,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildDialogRow(
                      StringConstants.releaseNoteHead,
                      buildModel.releaseNote,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildDialogRow(
                      StringConstants.deadlineHead,
                      FormatDateTime.formatDateTime(buildModel.deadline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7 * 0.5,
      padding: CustomPadding.commonPadding8,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: ColorConstants.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                ),
                Text(
                  buildModel.buildName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => showDetailsDialog(context),
                  icon: Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).primaryColorDark,
                    size: 30,
                  ),
                  iconSize: 30,
                )
              ],
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Theme.of(context).backgroundColor,
            ),
            GetBuilder<IssueController>(
              init: IssueController(),
              builder: (issueData) {
                return Container(
                  height:
                      issueData.issueByBuild(buildModel.buildId).length * 55,
                  child: ListView.builder(
                    itemCount:
                        issueData.issueByBuild(buildModel.buildId).length,
                    itemBuilder: (ctx, index) => buildIssueTile(context,
                        issueData.issueByBuild(buildModel.buildId)[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}