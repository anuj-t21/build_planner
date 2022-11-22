import 'package:build_planner/modules/issues/controllers/estimate/estimate_controller.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:build_planner/utils/format_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateWebTile extends GetView<EstimateController> {
  final String issueId;
  EstimateWebTile({required this.issueId});

  Widget buildTile({
    BuildContext? context,
    bool? isHead,
    String? product,
    String? platform,
    String? user,
    String? duration,
    String? date,
    String? status,
  }) {
    final width = Get.width * 0.7 * 0.9 * 0.18;
    return Container(
      padding: CustomPadding.commonPadding12,
//      color: isHead! ? Colors.grey.shade50 : Colors.white,
//      width: Get.width * 0.7 * 0.9,
      decoration: isHead!
          ? BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: StyleConstants.tl8tr8Border,
            )
          : null,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width,
              child: Text(
                isHead ? StringConstants.productHead : product!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHead ? FontWeight.bold : null,
                ),
              ),
            ),
            Container(
              width: width,
              child: Text(
                isHead ? StringConstants.platformHead : platform!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHead ? FontWeight.bold : null,
                ),
              ),
            ),
            Container(
              width: width,
              child: Text(
                isHead ? StringConstants.developerHead : user!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHead ? FontWeight.bold : null,
                ),
              ),
            ),
            Container(
              width: width,
              child: Text(
                isHead ? StringConstants.durationHead : duration!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHead ? FontWeight.bold : null,
                ),
              ),
            ),
            Container(
              width: width,
              child: Text(
                isHead ? StringConstants.dateHead : date!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHead ? FontWeight.bold : null,
                ),
              ),
            ),
            Container(
              width: width,
              child: Text(
                isHead ? StringConstants.statusHead : status!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isHead ? FontWeight.bold : null,
                ),
              ),
            ),
          ],
        ),
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
          height: (controller.estimatesByIssueId(issueId).length) * 45 + 45,
          child: Column(
            children: [
              buildTile(
                context: context,
                isHead: true,
              ),
              Container(
                height: (controller.estimatesByIssueId(issueId).length) * 45,
                child: ListView.builder(
                    itemCount: controller.estimatesByIssueId(issueId).length,
                    itemBuilder: (ctx, index) {
                      return buildTile(
                        context: context,
                        isHead: false,
                        product: controller
                            .estimatesByIssueId(issueId)[index]
                            .product,
                        platform: controller
                            .estimatesByIssueId(issueId)[index]
                            .platform,
                        user: controller
                            .estimatesByIssueId(issueId)[index]
                            .user
                            .name,
                        duration: controller
                            .estimatesByIssueId(issueId)[index]
                            .duration
                            .toString(),
                        date: FormatDateTime.formatDateTime(
                          controller.estimatesByIssueId(issueId)[index].date,
                        ),
                        status: controller
                            .estimatesByIssueId(issueId)[index]
                            .status,
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

//Card(
//color: ColorConstants.cardColor,
//child: Padding(
//padding: CustomPadding.commonPadding8,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: [
//Container(
//width: 100,
//child: Text('Product'),
//),
//Container(
//width: 100,
//child: Text('Platform'),
//),
//Container(
//width: 100,
//child: Text('Developer'),
//),
//Container(
//width: 100,
//child: Text('Time'),
//),
//Container(
//width: 100,
//child: Text('Date'),
//),
//Container(
//width: 100,
//child: Text('Status'),
//),
//],
//),
//),
//),
