import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/format_date_time.dart';
import 'package:flutter/material.dart';

class HistoryActionTile extends StatelessWidget {
  final String action;
  final DateTime dateTime;

  HistoryActionTile({
    required this.action,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.commonPadding4,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                action,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                FormatDateTime.formatDateTime(dateTime),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
