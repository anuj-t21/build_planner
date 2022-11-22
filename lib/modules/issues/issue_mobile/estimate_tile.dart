import 'package:build_planner/modules/issues/controllers/estimate/estimate_controller.dart';
import 'package:build_planner/modules/issues/controllers/estimate/estimate_model.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildPlatTile(BuildContext context, EstimateModel estimateModel) {
//  final deviceSize = MediaQuery.of(context).size;
  return Column(
    children: [
      Container(
        padding: CustomPadding.commonPadding8,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                child: Text(
                  estimateModel.platform,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  estimateModel.duration,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  estimateModel.user.name,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      Divider(
        thickness: 1,
        color: Theme.of(context).backgroundColor,
      ),
    ],
  );
}

class EstimateTile extends GetView<EstimateController> {
  final String issueId;
  EstimateTile({required this.issueId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.paddingVertical8,
      child: InkWell(
        onTap: () {},
        child: Card(
//          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: ColorConstants.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: StyleConstants.commonBorder8,
          ),
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 50,
                color: Colors.grey.shade50,
                child: Center(
                  child: Text(
                    StringConstants.estimateHead,
//                style: FlutterFlowTheme.title3.override(
//                  fontFamily: 'Poppins',
//                ),
                  ),
                ),
              ),
              Container(
                height: controller.estimatesByIssueId(issueId).length * 50,
                child: ListView.builder(
                  itemCount: controller.estimatesByIssueId(issueId).length,
                  itemBuilder: (ctx, index) => buildPlatTile(
                    context,
                    controller.estimatesByIssueId(issueId)[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
