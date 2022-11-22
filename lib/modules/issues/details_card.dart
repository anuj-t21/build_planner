import 'package:build_planner/modules/issues/controllers/issue/issue_model.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:build_planner/utils/format_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsCard extends StatelessWidget {
  final IssueModel issueModel;
  DetailsCard({required this.issueModel});

  Widget _buildTile(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.commonPadding20,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: StyleConstants.commonBorder8,
          ),
          height: Get.height * 0.34,
          width: Get.width * 0.26,
          padding: CustomPadding.commonPadding12,
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.detailHead.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTile(
                          StringConstants.baHead,
                          issueModel.ba.name,
                        ),
                        _buildTile(
                          StringConstants.statusHead,
                          issueModel.status,
                        ),
                        _buildTile(
                          StringConstants.descriptionHead,
                          issueModel.description,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildTile(
                          StringConstants.baHead,
                          FormatDateTime.formatDateTime(issueModel.baTimeline),
                        ),
                        _buildTile(
                          StringConstants.devHead,
                          FormatDateTime.formatDateTime(issueModel.devTimeline),
                        ),
                        _buildTile(
                          StringConstants.qaHead,
                          FormatDateTime.formatDateTime(issueModel.qaTimeline),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
