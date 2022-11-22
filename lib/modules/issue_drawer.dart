import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class IssueDrawer extends StatelessWidget {
  final IssueModel issueModel;
  IssueDrawer({required this.issueModel});

  Widget buildTile(BuildContext context, String head, String tail) {
    return Column(
      children: [
        ListTile(
          title: Text(
            head,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(tail),
        ),
        Divider(
          color: Theme.of(context).backgroundColor,
        ),
      ],
    );
  }

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
              child: Center(
                child: Padding(
                  padding: CustomPadding.commonPadding8,
                  child: Text(
                    issueModel.issueID,
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
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
                    buildTile(
                      context,
                      StringConstants.baHead,
                      issueModel.ba.name,
                    ),
                    buildTile(
                      context,
                      StringConstants.descriptionHead,
                      issueModel.description,
                    ),
                    buildTile(
                      context,
                      StringConstants.statusHead,
                      issueModel.status,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildTile(
                      context,
                      StringConstants.timelineHead,
                      '',
                    ),
                    buildTile(
                      context,
                      StringConstants.baHead,
                      issueModel.baTimeline.toString(),
                    ),
                    buildTile(
                      context,
                      StringConstants.devHead,
                      issueModel.devTimeline.toString(),
                    ),
                    buildTile(
                      context,
                      StringConstants.qaHead,
                      issueModel.qaTimeline.toString(),
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
