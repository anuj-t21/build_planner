import 'package:build_planner/base/custom_chip.dart';
import 'package:build_planner/modules/issues/controllers/notify/notify_controller.dart';
import 'package:build_planner/utils/constants/color_constants.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyTile extends StatefulWidget {
  final String issueId;
  NotifyTile({required this.issueId});

  @override
  _NotifyTileState createState() => _NotifyTileState();
}

class _NotifyTileState extends State<NotifyTile> {
  var _expanded = false;
  final NotifyController notifyController = Get.find();

  @override
  Widget build(BuildContext context) {
    final length = notifyController.notifyUserByIssueId(widget.issueId).length;
    return Padding(
      padding: CustomPadding.paddingHorizontal4Vertical8,
      child: Container(
        width: double.infinity,
        height: _expanded ? (length * 60) + 70 : 70,
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
                    StringConstants.notifyHead,
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
                Container(
                  height: length * 60,
                  child: ListView.builder(
                    itemCount: length,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            notifyController
                                .notifyUserByIssueId(widget.issueId)[index]
                                .role,
                          ),
                          trailing: Container(
                            width: 100,
                            padding: CustomPadding.commonPadding4,
                            child: CustomChip(
                              text: notifyController
                                  .notifyUserByIssueId(widget.issueId)[index]
                                  .user
                                  .name,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
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

//                  Container(
//                    color: Theme.of(context).primaryColor,
//                    height: (length / 2).ceil() * 60,
//                    width: length == 1 ? 120 : 240,
//                    child: GridView.builder(
//                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                        crossAxisCount: 2,
//                        mainAxisSpacing: 2,
//                        crossAxisSpacing: 2,
//                        childAspectRatio: 2,
//                      ),
//                      itemCount: controller.notifyUserByIssueId(issueId).length,
//                      itemBuilder: (ctx, index) => Center(
//                        child: Container(
////                    height: 50,
//                          width: 100,
//                          decoration: BoxDecoration(
//                            color: Theme.of(context).primaryColorDark,
//                            borderRadius: BorderRadius.circular(28),
//                          ),
//                          child: Padding(
//                            padding:
//                                EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                            child: Center(
//                              child: Text(
//                                controller
//                                    .notifyUserByIssueId(issueId)[index]
//                                    .user
//                                    .name,
//                                style: TextStyle(color: Colors.white),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//              Row(
//                children: [
//                  Padding(
//                    padding: CustomPadding.commonPadding4,
//                    child: CustomButton(
//                      text: 'Rahul',
//                      onPressed: () {},
//                      icon: Icon(
//                        Icons.delete,
//                        size: 14,
//                      ),
//                      circularBorder: true,
//                    ),
//                  ),
//                  Padding(
//                    padding: CustomPadding.commonPadding4,
//                    child: CustomButton(
//                      text: 'Zack',
//                      onPressed: () {},
//                      icon: Icon(
//                        Icons.delete,
//                        size: 14,
//                      ),
//                      circularBorder: true,
//                    ),
//                  ),
//                ],
//              ),

//          CustomButton(
//            text: 'Add',
//            onPressed: () {},
//            icon: Icon(
//              Icons.add,
//              color: Colors.black,
//            ),
//            circularBorder: true,
//            color: Theme.of(context).backgroundColor,
//          ),
