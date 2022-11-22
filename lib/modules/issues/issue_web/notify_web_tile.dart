import 'package:build_planner/base/custom_chip.dart';
import 'package:build_planner/modules/issues/controllers/notify/notify_controller.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyWebTile extends GetView<NotifyController> {
  final String issueId;
  NotifyWebTile({required this.issueId});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height:
            (controller.notifyUserByIssueId(issueId).length / 6).ceil() * 90,
        width: 600,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: controller.notifyUserByIssueId(issueId).length,
          itemBuilder: (ctx, index) => Container(
            child: Padding(
              padding: CustomPadding.commonPadding8,
              child: CustomChip(
                text: controller.notifyUserByIssueId(issueId)[index].user.name,
                icon: Icons.clear,
                onIconPressed: () => controller.removeNotifyUser(
                    controller.notifyUserByIssueId(issueId)[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
