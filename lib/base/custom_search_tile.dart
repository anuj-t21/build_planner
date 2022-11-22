import 'package:build_planner/base/custom_text_field.dart';
import 'package:build_planner/utils/constants/custom_padding.dart';
import 'package:build_planner/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchTile extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function() onPressed;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSave;
  final void Function(String? value)? onChange;

  CustomSearchTile({
    required this.textEditingController,
    required this.onPressed,
    this.validator,
    this.onSave,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.commonPadding4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: CustomPadding.commonPadding8,
              child: CustomTextField(
                width: Get.width * 0.7,
                circularBorder: true,
                hintText: StringConstants.searchHintText,
                textEditingController: textEditingController,
                onSave: onSave,
                onChange: onChange,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed(),
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColorDark,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
