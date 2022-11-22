import 'package:build_planner/base/custom_chip.dart';
import 'package:build_planner/modules/issues/controllers/document/document_controller.dart';
import 'package:build_planner/modules/issues/controllers/document/document_model.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:build_planner/utils/format_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentTile extends GetView<DocumentController> {
  final String issueId;
  DocumentTile({required this.issueId});

  Widget buildRows(BuildContext context, DocumentModel documentModel) {
    return Column(
      children: [
        Padding(
          padding: CustomPadding.commonPadding8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    documentModel.name,
                  ),
                  Text(
                    FormatDateTime.formatDateTime(documentModel.dateTime),
                  ),
                ],
              ),
              Padding(
                padding: CustomPadding.commonPadding4,
                child: CustomChip(text: StringConstants.viewHead),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Theme.of(context).backgroundColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.paddingVertical8,
      child: Card(
//        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: ColorConstants.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: Get.width,
              height: 50,
              color: Colors.grey.shade50,
              child: Center(
                child: Text(
                  StringConstants.documentHead,
//                style: FlutterFlowTheme.title3.override(
//                  fontFamily: 'Poppins',
//                ),
                ),
              ),
            ),
            Container(
              height: controller.documentByIssueId(issueId).length * 70,
              child: ListView.builder(
                itemCount: controller.documentByIssueId(issueId).length,
                itemBuilder: (ctx, index) => buildRows(
                  context,
                  controller.documentByIssueId(issueId)[index],
                ),
              ),
            ),
//            buildRows(
//              context,
//            ),
//            Divider(
//              thickness: 1,
//              color: Theme.of(context).backgroundColor,
//            ),
//            buildRows(context, 'Attach'),
          ],
        ),
      ),
    );
  }
}
