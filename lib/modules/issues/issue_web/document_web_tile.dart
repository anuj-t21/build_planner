import 'package:build_planner/modules/issues/controllers/document/document_controller.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:build_planner/utils/format_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentWebTile extends GetView<DocumentController> {
  final String issueId;
  DocumentWebTile({required this.issueId});

  Widget buildTile({
    BuildContext? context,
    bool? isHead,
    String? docName,
    String? date,
  }) {
    return Container(
      padding: CustomPadding.commonPadding12,
//      color: isHead! ? Colors.grey.shade50 : Colors.white,
      decoration: isHead!
          ? BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: StyleConstants.tl8tr8Border,
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200,
            child: Text(
              isHead ? StringConstants.documentHead : docName!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: isHead ? FontWeight.bold : null,
              ),
            ),
          ),
          Container(
            width: 200,
            child: Text(
              isHead ? StringConstants.dateHead : date!,
              style: TextStyle(
                fontWeight: isHead ? FontWeight.bold : null,
              ),
            ),
          ),
          Container(
            width: 200,
            child: Text(
              isHead
                  ? StringConstants.attachmentHead
                  : StringConstants.viewHead,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: !isHead ? Theme.of(context!).primaryColor : null,
                fontWeight: isHead ? FontWeight.bold : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.commonBorder8,
        ),
        child: Container(
          height: (controller.documentByIssueId(issueId).length) * 45 + 45,
          child: Column(
            children: [
              buildTile(
                context: context,
                isHead: true,
              ),
              Container(
                height: (controller.documentByIssueId(issueId).length) * 45,
                child: ListView.builder(
                    itemCount: controller.documentByIssueId(issueId).length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        child: buildTile(
                          context: context,
                          isHead: false,
                          docName:
                              controller.documentByIssueId(issueId)[index].name,
                          date: FormatDateTime.formatDateTime(
                            controller
                                .documentByIssueId(issueId)[index]
                                .dateTime,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
