import 'package:build_planner/base/custom_text_field.dart';
import 'package:build_planner/modules/logs/controller/logs_controller.dart';
import 'package:build_planner/modules/logs/controller/logs_model.dart';
import 'package:build_planner/controllers/user/user_model.dart';
import 'package:build_planner/modules/logs/chat_tile.dart';
import 'package:build_planner/modules/logs/history_action_tile.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogsWidget extends GetView<LogsController> {
  final issueId;
  LogsWidget({required this.issueId});
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Widget buildSendMessageTile(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var textMessage = '';
    return Padding(
      padding: CustomPadding.commonPadding8,
      child: Row(
//        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextField(
            width: ResponsiveWidget.isLargeScreen(context)
                ? deviceSize.width * 0.2 //0.75 * 0.9
                : deviceSize.width * 0.8,
            circularBorder: true,
            hintText: StringConstants.sendTextFieldHintText,
            textEditingController: textEditingController,
            onChange: (value) {
              textMessage = value ?? '';
            },
          ),
          IconButton(
            onPressed: () {
              LogsModel logs = LogsModel(
                logId: DateTime.now().toString(),
                issueId: issueId,
                user: UserModel(
                  userId: '1234',
                  name: 'Anuj',
                  password: '',
                  email: '',
                  designation: '',
                  phone: '',
                ),
                isMessage: true,
                byCurrentUser: true,
                text: textMessage,
                date: DateTime.now(),
              );

              controller.addLog(logs);
              textEditingController.clear();
              _scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            },
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColorDark,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: ResponsiveWidget.isLargeScreen(context)
          ? Get.height * 0.9
          : Get.height * 0.88,
      width: ResponsiveWidget.isLargeScreen(context)
          ? Get.width * 0.75
          : Get.width,
      child: Column(
//        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: CustomPadding.commonPadding8,
              child: Obx(
//                  height: deviceSize.height * 0.7,
                () => ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.logsByIssueId(issueId).length,
                  itemBuilder: (ctx, index) => controller
                          .logsByIssueId(issueId)[index]
                          .isMessage
                      ? ChatTile(
                          username: controller
                              .logsByIssueId(issueId)[index]
                              .user
                              .name,
                          text: controller.logsByIssueId(issueId)[index].text,
                          imageUrl: '',
                          textByCurrentUser: controller
                              .logsByIssueId(issueId)[index]
                              .byCurrentUser,
                        )
                      : HistoryActionTile(
                          action: controller
                                  .logsByIssueId(issueId)[index]
                                  .user
                                  .name +
                              ' ' +
                              controller.logsByIssueId(issueId)[index].text,
                          dateTime:
                              controller.logsByIssueId(issueId)[index].date,
                        ),
                ),
              ),
            ),
          ),
          buildSendMessageTile(context)
        ],
      ),
    );
  }
}
