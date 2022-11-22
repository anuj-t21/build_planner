import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/style_constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final String? key2;

  CustomListTile({
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.key2,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.commonPadding8,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: StyleConstants.commonBorder12,
        ),
        child: Padding(
          padding: CustomPadding.commonPadding4,
          child: ListTile(
            key: key2 != null ? Key(key2!) : UniqueKey(),
            leading: leading ?? null,
            title: title,
            subtitle: subtitle ?? null,
            trailing: trailing ?? null,
            dense: false,
          ),
        ),
      ),
    );
  }
}
