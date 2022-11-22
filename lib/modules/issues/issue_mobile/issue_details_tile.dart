import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';

class IssueDetailsTile extends StatefulWidget {
  final IssueModel issueModel;
  IssueDetailsTile({required this.issueModel});
  @override
  _IssueDetailsTileState createState() => _IssueDetailsTileState();
}

class _IssueDetailsTileState extends State<IssueDetailsTile> {
  var _expanded = false;

  Widget buildContainerRows({required String head, required String body}) {
    return Padding(
      padding: CustomPadding.paddingVertical4,
      child: Row(
        children: [
          Text(head),
          Spacer(),
          Text(body),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.paddingHorizontal4Vertical8,
      child: Container(
        height: _expanded ? 280 : 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.cardColor,
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Padding(
          padding: CustomPadding.commonPadding8,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.detailHead,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                    icon: _expanded
                        ? Icon(Icons.arrow_drop_up)
                        : Icon(Icons.arrow_drop_down),
                    color: Theme.of(context).backgroundColor,
                  ),
                ],
              ),
              if (_expanded)
                Column(
                  children: [
                    buildContainerRows(
                      head: StringConstants.issueIdHead,
                      body: widget.issueModel.issueID,
                    ),
                    buildContainerRows(
                      head: StringConstants.baHead,
                      body: widget.issueModel.ba.name,
                    ),
                    buildContainerRows(
                      head: StringConstants.statusHead,
                      body: widget.issueModel.status,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildContainerRows(
                      head: StringConstants.timelineHead,
                      body: widget.issueModel.baTimeline.toString(),
                    ),
                    buildContainerRows(
                      head: StringConstants.baHead,
                      body: widget.issueModel.baTimeline.toString(),
                    ),
                    buildContainerRows(
                      head: StringConstants.qaHead,
                      body: widget.issueModel.qaTimeline.toString(),
                    ),
                    buildContainerRows(
                      head: StringConstants.devHead,
                      body: widget.issueModel.devTimeline.toString(),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
